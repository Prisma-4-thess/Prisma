package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(RelativeDecisionController)
@Mock(RelativeDecision)
class RelativeDecisionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/relativeDecision/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.relativeDecisionInstanceList.size() == 0
        assert model.relativeDecisionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.relativeDecisionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.relativeDecisionInstance != null
        assert view == '/relativeDecision/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/relativeDecision/show/1'
        assert controller.flash.message != null
        assert RelativeDecision.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/relativeDecision/list'

        populateValidParams(params)
        def relativeDecision = new RelativeDecision(params)

        assert relativeDecision.save() != null

        params.id = relativeDecision.id

        def model = controller.show()

        assert model.relativeDecisionInstance == relativeDecision
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/relativeDecision/list'

        populateValidParams(params)
        def relativeDecision = new RelativeDecision(params)

        assert relativeDecision.save() != null

        params.id = relativeDecision.id

        def model = controller.edit()

        assert model.relativeDecisionInstance == relativeDecision
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/relativeDecision/list'

        response.reset()

        populateValidParams(params)
        def relativeDecision = new RelativeDecision(params)

        assert relativeDecision.save() != null

        // test invalid parameters in update
        params.id = relativeDecision.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/relativeDecision/edit"
        assert model.relativeDecisionInstance != null

        relativeDecision.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/relativeDecision/show/$relativeDecision.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        relativeDecision.clearErrors()

        populateValidParams(params)
        params.id = relativeDecision.id
        params.version = -1
        controller.update()

        assert view == "/relativeDecision/edit"
        assert model.relativeDecisionInstance != null
        assert model.relativeDecisionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/relativeDecision/list'

        response.reset()

        populateValidParams(params)
        def relativeDecision = new RelativeDecision(params)

        assert relativeDecision.save() != null
        assert RelativeDecision.count() == 1

        params.id = relativeDecision.id

        controller.delete()

        assert RelativeDecision.count() == 0
        assert RelativeDecision.get(relativeDecision.id) == null
        assert response.redirectedUrl == '/relativeDecision/list'
    }
}
