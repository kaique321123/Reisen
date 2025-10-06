Before do
  RSpec::Mocks.setup
end

After do
  begin
    RSpec::Mocks.verify
  ensure
    RSpec::Mocks.teardown
  end
end

Before('@mock_airlines') do
  mocked_airlines = {
    "Latam" => "/mock/latam",
    "Gol"   => "/mock/gol",
    "Azul"  => "/mock/azul"
  }
  allow_any_instance_of(DocumentosController).to receive(:airlines).and_return(mocked_airlines)
end