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
    wrapper = shallow(<ParkShowContainer match={routerParams}/>);
  })

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({park: {}})
  });

  it('should render a ParkShow Component', () => {
    wrapper.setState({park: park})

    expect(wrapper.find("ParkShow")).toBePresent()
  })

  it('should render the ParkShow Component with specific props when specfic park is selected', () => {
    wrapper.setState({park: park})

    expect(wrapper.find("ParkShow").props()).toEqual({
      id:1,
      name:"Mattapan Park",
      description:"This place is dangerous",
      address:"19 State Road",
      city:"Mattapan",
      state:"MA",
      zip:"06661"
    })
  })
})
