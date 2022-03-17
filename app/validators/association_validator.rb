class AssociationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, messge: 'must be a valid record' if options[:with].find_by_id(value).nil?
  end
end
