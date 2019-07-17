import ParkShowContainer from '../../app/javascript/react/containers/ParkShowContainer'
import ParkShow from '../../app/javascript/react/components/ParkShow'

describe('ParkShowContainer', () => {
  let wrapper;

  beforeEach(() => {
    const routerParams = { params: { id: 1}}
    wrapper = mount(<ParkShowContainer match={routerParams} />);
  })



  it('should have the specified initial state', () => {

    expect(wrapper.state()).toEqual({park: {}})
  });

  it('should render a ParkShow Component', () => {
    expect(wrapper.find(ParkShow)).toBePresent()
  });

  it('should render the ParkShow Component with specific props when specfic park is selected', () => {
    expect(wrapper.find(ParkShow).props()).toEqual({
      name:"Mattapan Park",
      description:"This place is dangerous",
      address:"19 State Road",
      city:"Mattapan",
      state:"MA",
      zip:"06661"
    })

  })







})
