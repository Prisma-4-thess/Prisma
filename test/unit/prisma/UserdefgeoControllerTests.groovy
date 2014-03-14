package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(UserdefgeoController)
@Mock(Userdefgeo)
class UserdefgeoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userdefgeo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userdefgeoInstanceList.size() == 0
        assert model.userdefgeoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userdefgeoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userdefgeoInstance != null
        assert view == '/userdefgeo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userdefgeo/show/1'
        assert controller.flash.message != null
        assert Userdefgeo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userdefgeo/list'

        populateValidParams(params)
        def userdefgeo = new Userdefgeo(params)

        assert userdefgeo.save() != null

        params.id = userdefgeo.id

        def model = controller.show()

        assert model.userdefgeoInstance == userdefgeo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userdefgeo/list'

        populateValidParams(params)
        def userdefgeo = new Userdefgeo(params)

        assert userdefgeo.save() != null

        params.id = userdefgeo.id

        def model = controller.edit()

        assert model.userdefgeoInstance == userdefgeo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userdefgeo/list'

        response.reset()

        populateValidParams(params)
        def userdefgeo = new Userdefgeo(params)

        assert userdefgeo.save() != null

        // test invalid parameters in update
        params.id = userdefgeo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userdefgeo/edit"
        assert model.userdefgeoInstance != null

        userdefgeo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userdefgeo/show/$userdefgeo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userdefgeo.clearErrors()

        populateValidParams(params)
        params.id = userdefgeo.id
        params.version = -1
        controller.update()

        assert view == "/userdefgeo/edit"
        assert model.userdefgeoInstance != null
        assert model.userdefgeoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userdefgeo/list'

        response.reset()

        populateValidParams(params)
        def userdefgeo = new Userdefgeo(params)

        assert userdefgeo.save() != null
        assert Userdefgeo.count() == 1

        params.id = userdefgeo.id

        controller.delete()

        assert Userdefgeo.count() == 0
        assert Userdefgeo.get(userdefgeo.id) == null
        assert response.redirectedUrl == '/userdefgeo/list'
    }
}
