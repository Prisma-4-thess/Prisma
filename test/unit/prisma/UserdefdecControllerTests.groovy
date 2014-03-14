package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(UserdefdecController)
@Mock(Userdefdec)
class UserdefdecControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userdefdec/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userdefdecInstanceList.size() == 0
        assert model.userdefdecInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userdefdecInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userdefdecInstance != null
        assert view == '/userdefdec/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userdefdec/show/1'
        assert controller.flash.message != null
        assert Userdefdec.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userdefdec/list'

        populateValidParams(params)
        def userdefdec = new Userdefdec(params)

        assert userdefdec.save() != null

        params.id = userdefdec.id

        def model = controller.show()

        assert model.userdefdecInstance == userdefdec
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userdefdec/list'

        populateValidParams(params)
        def userdefdec = new Userdefdec(params)

        assert userdefdec.save() != null

        params.id = userdefdec.id

        def model = controller.edit()

        assert model.userdefdecInstance == userdefdec
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userdefdec/list'

        response.reset()

        populateValidParams(params)
        def userdefdec = new Userdefdec(params)

        assert userdefdec.save() != null

        // test invalid parameters in update
        params.id = userdefdec.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userdefdec/edit"
        assert model.userdefdecInstance != null

        userdefdec.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userdefdec/show/$userdefdec.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userdefdec.clearErrors()

        populateValidParams(params)
        params.id = userdefdec.id
        params.version = -1
        controller.update()

        assert view == "/userdefdec/edit"
        assert model.userdefdecInstance != null
        assert model.userdefdecInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userdefdec/list'

        response.reset()

        populateValidParams(params)
        def userdefdec = new Userdefdec(params)

        assert userdefdec.save() != null
        assert Userdefdec.count() == 1

        params.id = userdefdec.id

        controller.delete()

        assert Userdefdec.count() == 0
        assert Userdefdec.get(userdefdec.id) == null
        assert response.redirectedUrl == '/userdefdec/list'
    }
}
