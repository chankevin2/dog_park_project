import ParkShowContainer from '../../app/javascript/react/containers/ParkShowContainer'
import ParkShow from '../../app/javascript/react/components/ParkShow'
import fetchMock from 'fetch-mock'

describe('ParkShowContainer', () => {
  let wrapper, park;

  beforeEach(() => {
    const routerParams = { params: { id: 1}}
    park = {
      id:1,
      name:"Mattapan Park",
      description:"This place is dangerous",
      address:"19 State Road",
      city:"Mattapan",
      state:"MA",
      zip:"06661"
    }

    fetchMock.get('/api/v1/parks/1', {
      status: 200,
      body: park
    })

    wrapper = mount(<ParkShowContainer match={routerParams}/>);
  })

  afterEach(fetchMock.restore)

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({park: {}})
  });

  it('renders a park fetched from api call', (done) => {
    setTimeout(() => {
      expect(wrapper.find('h3').text()).toEqual(park.name)
        done()
    }, 0)
  })

  it('should render a ParkShow Component', (done) => {
    setTimeout(() => {
      expect(wrapper.find(ParkShow)).toBePresent()
        done()
    }, 0)
  })


  it('should render the ParkShow Component with specific props when specfic park is selected', (done) => {
    setTimeout(() => {
      expect(wrapper.find(ParkShow).props()).toEqual({
        id:1,
        name:"Mattapan Park",
        description:"This place is dangerous",
        address:"19 State Road",
        city:"Mattapan",
        state:"MA",
        zip:"06661"
      })
        done()
    }, 0)
  })
})
