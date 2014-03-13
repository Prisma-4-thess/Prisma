package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(PredefinedController)
@Mock(Predefined)
class PredefinedControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/predefined/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.predefinedInstanceList.size() == 0
        assert model.predefinedInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.predefinedInstance != null
    }

    void testSave() {
        controller.save()

        assert model.predefinedInstance != null
        assert view == '/predefined/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/predefined/show/1'
        assert controller.flash.message != null
        assert Predefined.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/predefined/list'

        populateValidParams(params)
        def predefined = new Predefined(params)

        assert predefined.save() != null

        params.id = predefined.id

        def model = controller.show()

        assert model.predefinedInstance == predefined
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/predefined/list'

        populateValidParams(params)
        def predefined = new Predefined(params)

        assert predefined.save() != null

        params.id = predefined.id

        def model = controller.edit()

        assert model.predefinedInstance == predefined
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/predefined/list'

        response.reset()

        populateValidParams(params)
        def predefined = new Predefined(params)

        assert predefined.save() != null

        // test invalid parameters in update
        params.id = predefined.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/predefined/edit"
        assert model.predefinedInstance != null

        predefined.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/predefined/show/$predefined.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        predefined.clearErrors()

        populateValidParams(params)
        params.id = predefined.id
        params.version = -1
        controller.update()

        assert view == "/predefined/edit"
        assert model.predefinedInstance != null
        assert model.predefinedInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/predefined/list'

        response.reset()

        populateValidParams(params)
        def predefined = new Predefined(params)

        assert predefined.save() != null
        assert Predefined.count() == 1

        params.id = predefined.id

        controller.delete()

        assert Predefined.count() == 0
        assert Predefined.get(predefined.id) == null
        assert response.redirectedUrl == '/predefined/list'
    }
}
