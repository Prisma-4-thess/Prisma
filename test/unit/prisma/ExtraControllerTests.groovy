package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(ExtraController)
@Mock(Extra)
class ExtraControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/extra/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.extraInstanceList.size() == 0
        assert model.extraInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.extraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.extraInstance != null
        assert view == '/extra/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/extra/show/1'
        assert controller.flash.message != null
        assert Extra.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/extra/list'

        populateValidParams(params)
        def extra = new Extra(params)

        assert extra.save() != null

        params.id = extra.id

        def model = controller.show()

        assert model.extraInstance == extra
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/extra/list'

        populateValidParams(params)
        def extra = new Extra(params)

        assert extra.save() != null

        params.id = extra.id

        def model = controller.edit()

        assert model.extraInstance == extra
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/extra/list'

        response.reset()

        populateValidParams(params)
        def extra = new Extra(params)

        assert extra.save() != null

        // test invalid parameters in update
        params.id = extra.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/extra/edit"
        assert model.extraInstance != null

        extra.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/extra/show/$extra.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        extra.clearErrors()

        populateValidParams(params)
        params.id = extra.id
        params.version = -1
        controller.update()

        assert view == "/extra/edit"
        assert model.extraInstance != null
        assert model.extraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/extra/list'

        response.reset()

        populateValidParams(params)
        def extra = new Extra(params)

        assert extra.save() != null
        assert Extra.count() == 1

        params.id = extra.id

        controller.delete()

        assert Extra.count() == 0
        assert Extra.get(extra.id) == null
        assert response.redirectedUrl == '/extra/list'
    }
}
