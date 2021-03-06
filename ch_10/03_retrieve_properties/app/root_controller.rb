class RootController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
   
    @label = UILabel.new
    @label.text = 'Address Book'
    @label.frame = [[0,50],[UIScreen.mainScreen.bounds.size.width,50]]
    view.addSubview(@label)

    address_book = ABAddressBookCreate()

    unless address_book.nil?
      @label.text = "Address book successfully created!"
      p @label.text

      array_of_people = ABAddressBookCopyArrayOfAllPeople(address_book)

      array_of_people.each_with_index do |person, index|
        first_name = Pointer.new(:object)
        first_name = ABRecordCopyValue(person, KABPersonFirstNameProperty)
        last_name = Pointer.new(:object)
        last_name = ABRecordCopyValue(person, KABPersonLastNameProperty)
        p "Person #{index + 1}: Retrieved"
        p "First Name = #{first_name}"
        p "Last Name = #{last_name}"
        print_person_emails person
        p " -- "
      end

      @label.text = "#{array_of_people.count} person(s) in address book"
      p @label.text
    else
      @label.text = "Could not access address book"
      p @label.text
    end
  end

  def print_person_emails person
    if person.nil?
      p "Given person was nil"
      return
    end

    emails = Pointer.new(:object)
    emails = ABRecordCopyValue(person, KABPersonEmailProperty)

    if emails.nil?
      p "This contact has no emails"
      return
    end

    p "Number of emails = #{ABMultiValueGetCount(emails)}"

    email_array = ABMultiValueCopyArrayOfAllValues(emails) || []
    email_array.each_with_index do |email, index|
      email_label = Pointer.new(:object)
      # do stuffs with the email
    end   
  end

end
