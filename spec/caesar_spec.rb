describe Caesar do
  it "should start with an unshifted default message" do
    test_cipher = Caesar.new "This is a test!"
    expect(test_cipher.code).to eq("This is a test!")
  end
end