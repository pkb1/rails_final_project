class Item < ApplicationRecord
    
    def self.to_csv
      attributes = %w{id name authorname publicationname quantity price}
      CSV.generate(headers: true) do |csv|
        csv << attributes
        all.find_each do |item|
          csv << attributes.map{ |attr| item.send(attr) }
        end
      end
    end
    
    def self.to_xlsx
      wb = xlsx_package.workbook
    
      wb.styles do |style|
        project_heading = style.add_style(b: true, sz: 14)
        heading = style.add_style(b: true)
    
        wb.add_worksheet(name: "Library") do |sheet|
          # Add a title row
          sheet.add_row ["Book List"], style: project_heading
          # Add the date this was downloaded
          sheet.add_row ["Downloaded at", Time.now.strftime("%b %-d, %Y")]
          # Add a blank row
          sheet.add_row []
          # Create the header row
          sheet.add_row ["ID", "Book Name", "Author Name", "Publication Name", "Quantity", "Price"], style: heading
          # Create the database reference row
          sheet.add_row ["id", "name","authorname","publicationname", "quantity","price"], style: heading
          # Create entries for each item
          @items.each do |item|
            sheet.add_row [item.id, item.name,item.authorname,item.publicationname, item.quantity,item.price]
          end
        end
      end
    end
end
   