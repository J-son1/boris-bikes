# Boris Bikes Challenge

> Delivering a network of docking stations and bikes that anyone can use.

This program aims to emulate London's Boris Bikes (now '[Santander Cycles][santander cycles]') bike hire system, which consists of docking stations, bikes, infrastructure, and more.

[santander cycles]: https://tfl.gov.uk/modes/cycling/santander-cycles

<br>

***

## About

This is the week 1 challenge set of the Makers course, which comprises of 22 challenges, with each step building on the previous.

<details><summary><b>Challenges</b></summary>

- [x] 1. Setting up a Project
- [x] 2. Working with User Stories
- [x] 3. From a Domain Model to a Feature Test
- [x] 4. Errors are good
- [x] 5. From Feature Tests to Unit Tests
- [x] 6. Passing your first Unit Test
- [x] 7. Back to the feature
- [x] 8. Back to the unit
- [x] 9. Building a bike
- [x] 10. Making Docking Stations get Bikes
- [x] 11. Using Instance Variables
- [x] 12. Raising Exceptions
- [x] 13. Limiting Capacity
- [x] 14. Using Complex Attributes
- [x] 15. The Single Responsibility Principle
- [x] 16. Removing Magic Numbers
- [x] 17. Initialisation Defaults
- [x] 18. Dealing with Broken Bikes
- [x] 19. Isolating Tests with Doubles
- [x] 20. Mocking Behaviour on Doubles
- [ ] 21. Men with Ven
- [ ] 22. Modules as Mixins
</details>

***

## Tools used for development

- Ruby
  - IRB
- git
- RSpec

***

## Getting Started

1. Fork [Boris Bikes][boris bikes] repository from GitHub.
1. Clone forked repository to make a local copy: `git clone <forked_repo_url>`
1. From the command line `cd` into the directory with 'docking_station.rb'.
1. Using `irb`,  `require ./docking_station.rb `. (This can be done with one command: `irb -r ./docking_station.rb`)

[boris bikes]: https://github.com/J-son1/boris-bikes

## Usage example

```ruby
3.0.3 :001 > station = DockingStation.new
 => #<DockingStation:0x00007fcf0717f808 @bikes=[], @capacity=20> 
3.0.3 :002 > bike = Bike.new
 => #<Bike:0x00007fcf03988b70 @working=true> 
```

### DockingStation

- `.dock()`
  - pass as an argument an instance of Bike to dock a bike.

- `.release_bike`
  - release a working bike.

### Bike

- `.working?` or `.broken?`
   - check condition of a bike.

- `.report_broken`

***

## Testing

Run `rspec` from the Boris Bikes root directory.

#### Add tests

Create new tests for DockingStation and Bike by adding to './spec/docking_station_spec.rb' and ./spec/bike_spec.rb' respectively.

### Feature testing

A large part of developing this app was to use feature tests to trigger the red-green-refactor TDD process.

###### Example

```irb
3.0.3 :004 > docking_station = DockingStation.new
 => #<DockingStation:0x00007f9b7107d7d0> 
3.0.3 :005 > docking_station.dock
(irb):5:in `<main>': undefined method `dock' for #<DockingStation:0x00007f9b7107d7d0> (NoMethodError)
```