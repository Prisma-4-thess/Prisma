package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(TypeController)
@Mock(Type)
class TypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/type/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.typeInstanceList.size() == 0
        assert model.typeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.typeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.typeInstance != null
        assert view == '/type/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/type/show/1'
        assert controller.flash.message != null
        assert Type.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/type/list'

        populateValidParams(params)
        def type = new Type(params)

        assert type.save() != null

        params.id = type.id

        def model = controller.show()

        assert model.typeInstance == type
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/type/list'

        populateValidParams(params)
        def type = new Type(params)

        assert type.save() != null

        params.id = type.id

        def model = controller.edit()

        assert model.typeInstance == type
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/type/list'

        response.reset()

        populateValidParams(params)
        def type = new Type(params)

        assert type.save() != null

        // test invalid parameters in update
        params.id = type.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/type/edit"
        assert model.typeInstance != null

        type.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/type/show/$type.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        type.clearErrors()

        populateValidParams(params)
        params.id = type.id
        params.version = -1
        controller.update()

        assert view == "/type/edit"
        assert model.typeInstance != null
        assert model.typeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/type/list'

        response.reset()

        populateValidParams(params)
        def type = new Type(params)

        assert type.save() != null
        assert Type.count() == 1

        params.id = type.id

        controller.delete()

        assert Type.count() == 0
        assert Type.get(type.id) == null
        assert response.redirectedUrl == '/type/list'
    }
}
