class Drape::TestCase
  register_spec_type(self) do |desc|
    desc < Drape::Decorator || desc < Drape::CollectionDecorator if desc.is_a?(Class)
  end
  register_spec_type(/Decorator( ?Test)?\z/i, self)
end
