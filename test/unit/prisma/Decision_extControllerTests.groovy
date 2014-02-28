package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(Decision_extController)
@Mock(Decision_ext)
class Decision_extControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/decision_ext/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.decision_extInstanceList.size() == 0
        assert model.decision_extInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.decision_extInstance != null
    }

    void testSave() {
        controller.save()

        assert model.decision_extInstance != null
        assert view == '/decision_ext/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/decision_ext/show/1'
        assert controller.flash.message != null
        assert Decision_ext.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/decision_ext/list'

        populateValidParams(params)
        def decision_ext = new Decision_ext(params)

        assert decision_ext.save() != null

        params.id = decision_ext.id

        def model = controller.show()

        assert model.decision_extInstance == decision_ext
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/decision_ext/list'

        populateValidParams(params)
        def decision_ext = new Decision_ext(params)

        assert decision_ext.save() != null

        params.id = decision_ext.id

        def model = controller.edit()

        assert model.decision_extInstance == decision_ext
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/decision_ext/list'

        response.reset()

        populateValidParams(params)
        def decision_ext = new Decision_ext(params)

        assert decision_ext.save() != null

        // test invalid parameters in update
        params.id = decision_ext.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/decision_ext/edit"
        assert model.decision_extInstance != null

        decision_ext.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/decision_ext/show/$decision_ext.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        decision_ext.clearErrors()

        populateValidParams(params)
        params.id = decision_ext.id
        params.version = -1
        controller.update()

        assert view == "/decision_ext/edit"
        assert model.decision_extInstance != null
        assert model.decision_extInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/decision_ext/list'

        response.reset()

        populateValidParams(params)
        def decision_ext = new Decision_ext(params)

        assert decision_ext.save() != null
        assert Decision_ext.count() == 1

        params.id = decision_ext.id

        controller.delete()

        assert Decision_ext.count() == 0
        assert Decision_ext.get(decision_ext.id) == null
        assert response.redirectedUrl == '/decision_ext/list'
    }
}
