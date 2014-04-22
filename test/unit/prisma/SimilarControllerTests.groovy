package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(SimilarController)
@Mock(Similar)
class SimilarControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/similar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.similarInstanceList.size() == 0
        assert model.similarInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.similarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.similarInstance != null
        assert view == '/similar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/similar/show/1'
        assert controller.flash.message != null
        assert Similar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/similar/list'

        populateValidParams(params)
        def similar = new Similar(params)

        assert similar.save() != null

        params.id = similar.id

        def model = controller.show()

        assert model.similarInstance == similar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/similar/list'

        populateValidParams(params)
        def similar = new Similar(params)

        assert similar.save() != null

        params.id = similar.id

        def model = controller.edit()

        assert model.similarInstance == similar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/similar/list'

        response.reset()

        populateValidParams(params)
        def similar = new Similar(params)

        assert similar.save() != null

        // test invalid parameters in update
        params.id = similar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/similar/edit"
        assert model.similarInstance != null

        similar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/similar/show/$similar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        similar.clearErrors()

        populateValidParams(params)
        params.id = similar.id
        params.version = -1
        controller.update()

        assert view == "/similar/edit"
        assert model.similarInstance != null
        assert model.similarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/similar/list'

        response.reset()

        populateValidParams(params)
        def similar = new Similar(params)

        assert similar.save() != null
        assert Similar.count() == 1

        params.id = similar.id

        controller.delete()

        assert Similar.count() == 0
        assert Similar.get(similar.id) == null
        assert response.redirectedUrl == '/similar/list'
    }
}
