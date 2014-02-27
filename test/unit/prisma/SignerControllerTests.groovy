package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(SignerController)
@Mock(Signer)
class SignerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/signer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.signerInstanceList.size() == 0
        assert model.signerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.signerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.signerInstance != null
        assert view == '/signer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/signer/show/1'
        assert controller.flash.message != null
        assert Signer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/signer/list'

        populateValidParams(params)
        def signer = new Signer(params)

        assert signer.save() != null

        params.id = signer.id

        def model = controller.show()

        assert model.signerInstance == signer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/signer/list'

        populateValidParams(params)
        def signer = new Signer(params)

        assert signer.save() != null

        params.id = signer.id

        def model = controller.edit()

        assert model.signerInstance == signer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/signer/list'

        response.reset()

        populateValidParams(params)
        def signer = new Signer(params)

        assert signer.save() != null

        // test invalid parameters in update
        params.id = signer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/signer/edit"
        assert model.signerInstance != null

        signer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/signer/show/$signer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        signer.clearErrors()

        populateValidParams(params)
        params.id = signer.id
        params.version = -1
        controller.update()

        assert view == "/signer/edit"
        assert model.signerInstance != null
        assert model.signerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/signer/list'

        response.reset()

        populateValidParams(params)
        def signer = new Signer(params)

        assert signer.save() != null
        assert Signer.count() == 1

        params.id = signer.id

        controller.delete()

        assert Signer.count() == 0
        assert Signer.get(signer.id) == null
        assert response.redirectedUrl == '/signer/list'
    }
}
