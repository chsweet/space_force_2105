require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

RSpec.describe Flotilla do

  before :each do
    @daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    @kathy = Person.new('Kathy Chan', 10)
    @polly = Person.new('Polly Parker', 8)
    @rover = Person.new('Rover Henriette', 1)
    @sampson = Person.new('Sampson Edwards', 7)
    @seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    @daedalus.add_requirement({astrophysics: 6})
    @daedalus.add_requirement({quantum_mechanics: 3})

    @kathy.add_specialty(:astrophysics)
    @kathy.add_specialty(:quantum_mechanics)
    @polly.add_specialty(:operations)
    @polly.add_specialty(:maintenance)
    @rover.add_specialty(:operations)
    @rover.add_specialty(:maintenance)
    @sampson.add_specialty(:astrophysics)
    @sampson.add_specialty(:quantum_mechanics)
  end

  it 'exsits' do
    expect(@seventh_flotilla).to be_an_instance_of(Flotilla)
  end

  it 'has attributes' do
    expect(@seventh_flotilla.name).to eq('Seventh Flotilla')
    expect(@seventh_flotilla.personnel).to eq([])
    expect(@seventh_flotilla.ships).to eq([])
  end

  it 'adds ships' do
    @seventh_flotilla.add_ship(@daedalus)

    expect(@seventh_flotilla.ships).to eq([@daedalus])
  end

  it 'adds personnel and recommends to spacecraft' do
    @seventh_flotilla.add_ship(@daedalus)

    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)

    expect(@seventh_flotilla.personnel).to eq([@kathy, @polly, @rover, @sampson])
    expect(@seventh_flotilla.recommend_personnel(@daedalus)).to eq([@kathy, @sampson])

    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})

    @seventh_flotilla.add_ship(odyssey)

    expect(@seventh_flotilla.recommend_personnel(odyssey)).to be([@polly])
   end

   xit 'list personnel by ship' do
     odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
     odyssey.add_requirement({operations: 6})
     odyssey.add_requirement({maintenance: 3})

     @seventh_flotilla.add_personnel(@kathy)
     @seventh_flotilla.add_personnel(@polly)
     @seventh_flotilla.add_personnel(@rover)
     @seventh_flotilla.add_personnel(@sampson)

     expect(seventh_flotilla.ships).to eq([])

     @seventh_flotilla.add_ship(@daedalus)
     @seventh_flotilla.add_ship(odyssey)

     expect(seventh_flotilla.ships).to eq([@daedalus, odyssey])

     expect(seventh_flotilla.personnel_by_ship).to eq({@daedalus => [@kathy, @sampson], odyssey => [@polly]})
   end

end
