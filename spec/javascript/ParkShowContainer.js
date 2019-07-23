import ParkShowContainer from '../../app/javascript/react/containers/ParkShowContainer'
import ParkShow from '../../app/javascript/react/components/ParkShow'

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
      zip:"06661",
      reviews: [
        {
          "id": 16,
          "rating": 3,
          "body": "2;40",
          "park_id": 1
        }
      ]
    }
    wrapper = shallow(<ParkShowContainer match={routerParams}/>);
  })

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({park: {reviews: [], selectedThumbsUpId: null, selectedThumbsDownId: null}})
  });

  it('should render a ParkShow Component', () => {
    wrapper.setState({park: park})

    expect(wrapper.find("ParkShow")).toBePresent()
  })

  it('should render a ReviewTile Component', () => {
    wrapper.setState({park: park})

    expect(wrapper.find("ReviewTile")).toBePresent()
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
