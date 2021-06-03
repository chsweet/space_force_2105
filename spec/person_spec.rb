require './lib/person'

RSpec.describe Person do

  it 'exists' do
    kathy = Person.new('Kathy Chan', 10)

    expect(kathy).to be_an_instance_of(Person)
  end

  it 'has attributes' do
    kathy = Person.new('Kathy Chan', 10)

    expect(kathy.name).to be('Kathy Chan')
    expect(kathy.experience).to be(10)
    expect(kathy.specialties).to be([])
  end

  it 'adds specialties' do
    kathy = Person.new('Kathy Chan', 10)

    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    expect(kathy.specialties).to be([:astrophysics, :quantum_mechanics])
  end

end
