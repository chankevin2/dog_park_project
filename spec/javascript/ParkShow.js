import ParkShow from '../../app/javascript/react/components/ParkShow'


describe('ParkShow', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      < ParkShow
        name="Mattapan Park"
        description="This place is dangerous"
        address="19 State Road"
        city="Mattapan"
        state="MA"
        zip="06661"
       />
    )
  });

  it ('should render a h3 tag with the specific name',() => {
    expect(wrapper.find('h3').text()).toContain("Mattapan Park")
  })

  it ('should render a p tag with the description',() => {
    expect(wrapper.find('p#descr').text()).toContain("This place is dangerous")
  })

  it ('should render a p tag with the address',() => {
    expect(wrapper.find('p#address').text()).toContain("19 State Road")
  })

  it ('should render a p tag with the city',() => {
    expect(wrapper.find('p#address').text()).toContain("Mattapan")
  })

  it ('should render a p tag with the state',() => {
    expect(wrapper.find('p#address').text()).toContain("MA")
  })

  it ('should render a p tag with the zip',() => {
    expect(wrapper.find('p#address').text()).toContain("06661")
  })

})
