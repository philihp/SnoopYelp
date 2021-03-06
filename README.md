# Project 2 - SnoopYelp

Snoop Yelp is a Yelp search app using the [Yelp API](http://www.yelp.com/developers/documentation/v2/search_api).

Time spent: 60? hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] Search results page
   - [x] Table rows should be dynamic height according to the content height.
   - [x] Custom cells should have the proper Auto Layout constraints.
   - [x] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
- [x] Filter page. Unfortunately, not all the filters are supported in the Yelp API.
   - [x] The filters you should actually have are: category, sort (best match, distance, highest rated), distance, deals (on/off).
   - [x] The filters table should be organized into sections as in the mock.
   - [x] You can use the default UISwitch for on/off states.
   - [x] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
   - [x] Distance filter should expand as in the real Yelp app
   - [ ] Categories should show a subset of the full list with a "See All" row to expand. Category list is [here](http://www.yelp.com/developers/documentation/category_list).

The following **optional** features are implemented:

- [ ] Search results page
   - [ ] Infinite scroll for restaurant results.
   - [ ] Implement map view of restaurant results.
- [ ] Filter page
   - [ ] Implement a custom switch instead of the default UISwitch.
- [ ] Implement the restaurant detail page.

The following **additional** features are implemented:

- [x] Used Static instead of Dynamic for Filters page, so more of the code could exist in Storyboard
- [x] Used built-in System Items and Styles for a more "native" feel

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. It would be super dope to implement a feature that lets users play Restaurant-Tinder with images of food. Everyone swipes left or right on food until they all swipe right on a dish from the same restaurant, and then it notifies them that they have to go eat there.
2. Using UI in non-standard ways feels dirty. Putting in lots of effort to use out-of-the-box UI and get them to work is really rewarding.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://raw.githubusercontent.com/philihp/SnoopYelp/master/SnoopYelp.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I went through a lot of trouble to get my Filter page to have a TableViewController that had "Static Cells" in its content. This let my Interface Builder's visualization really accurately reflect what the resulting page would look like. Unfortunately this made it really difficult to have variable number of cells in a section. I ended up shelving the categories for last and made it work with Sorting an Distance by having additional scenes in the storyboard. I thought this worked much better as a UI, and is more close to the "Apple" way.

Unfortunately by the time I had to get the Categories to work, it just wasn't working out. Because of this I had to skip one of the user stories. It was pretty interesting, however in doing this I had to create CategoryTableView to handle this and be the DataSource, since FiltersViewController couldn't be.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
