package prisma



import org.junit.*
import grails.test.mixin.*

@TestFor(GeoController)
@Mock(Geo)
class GeoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/geo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.geoInstanceList.size() == 0
        assert model.geoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.geoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.geoInstance != null
        assert view == '/geo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/geo/show/1'
        assert controller.flash.message != null
        assert Geo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/geo/list'

        populateValidParams(params)
        def geo = new Geo(params)

        assert geo.save() != null

        params.id = geo.id

        def model = controller.show()

        assert model.geoInstance == geo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/geo/list'

        populateValidParams(params)
        def geo = new Geo(params)

        assert geo.save() != null

        params.id = geo.id

        def model = controller.edit()

        assert model.geoInstance == geo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/geo/list'

        response.reset()

        populateValidParams(params)
        def geo = new Geo(params)

        assert geo.save() != null

        // test invalid parameters in update
        params.id = geo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/geo/edit"
        assert model.geoInstance != null

        geo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/geo/show/$geo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        geo.clearErrors()

        populateValidParams(params)
        params.id = geo.id
        params.version = -1
        controller.update()

        assert view == "/geo/edit"
        assert model.geoInstance != null
        assert model.geoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/geo/list'

        response.reset()

        populateValidParams(params)
        def geo = new Geo(params)

        assert geo.save() != null
        assert Geo.count() == 1

        params.id = geo.id

        controller.delete()

        assert Geo.count() == 0
        assert Geo.get(geo.id) == null
        assert response.redirectedUrl == '/geo/list'
    }
}
