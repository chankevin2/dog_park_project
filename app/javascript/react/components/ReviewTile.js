import React from 'react'

const ReviewTile = (props) => {
  let reviews = props.reviews

  if (reviews !== undefined) {
    for (let i=0; i < reviews.length; i++){
      console.log(reviews[i].rating, reviews[i].body);
    }
  }

  return(
    <div>
    <li>
      
    </li>
    <br></br>
    </div>
  )
}

export default ReviewTile
