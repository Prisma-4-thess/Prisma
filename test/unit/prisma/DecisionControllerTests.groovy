package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(DecisionController)
@Mock(Decision)
class DecisionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/decision/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.decisionInstanceList.size() == 0
        assert model.decisionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.decisionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.decisionInstance != null
        assert view == '/decision/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/decision/show/1'
        assert controller.flash.message != null
        assert Decision.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/decision/list'

        populateValidParams(params)
        def decision = new Decision(params)

        assert decision.save() != null

        params.id = decision.id

        def model = controller.show()

        assert model.decisionInstance == decision
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/decision/list'

        populateValidParams(params)
        def decision = new Decision(params)

        assert decision.save() != null

        params.id = decision.id

        def model = controller.edit()

        assert model.decisionInstance == decision
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/decision/list'

        response.reset()

        populateValidParams(params)
        def decision = new Decision(params)

        assert decision.save() != null

        // test invalid parameters in update
        params.id = decision.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/decision/edit"
        assert model.decisionInstance != null

        decision.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/decision/show/$decision.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        decision.clearErrors()

        populateValidParams(params)
        params.id = decision.id
        params.version = -1
        controller.update()

        assert view == "/decision/edit"
        assert model.decisionInstance != null
        assert model.decisionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/decision/list'

        response.reset()

        populateValidParams(params)
        def decision = new Decision(params)

        assert decision.save() != null
        assert Decision.count() == 1

        params.id = decision.id

        controller.delete()

        assert Decision.count() == 0
        assert Decision.get(decision.id) == null
        assert response.redirectedUrl == '/decision/list'
    }
}
