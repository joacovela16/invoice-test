require "application_system_test_case"

class InvoiceHeadersTest < ApplicationSystemTestCase
  setup do
    @invoice_header = invoice_headers(:one)
  end

  test "visiting the index" do
    visit invoice_headers_url
    assert_selector "h1", text: "Invoice Headers"
  end

  test "creating a Invoice header" do
    visit invoice_headers_url
    click_on "New Invoice Header"

    click_on "Create Invoice header"

    assert_text "Invoice header was successfully created"
    click_on "Back"
  end

  test "updating a Invoice header" do
    visit invoice_headers_url
    click_on "Edit", match: :first

    click_on "Update Invoice header"

    assert_text "Invoice header was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice header" do
    visit invoice_headers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice header was successfully destroyed"
  end
end
