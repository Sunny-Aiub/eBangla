//
//  Data.swift
//  EBangla
//
//  Created by Sunny Chowdhury on 1/6/19.
//  Copyright © 2019 Sunny Chowdhury. All rights reserved.
//

import Foundation

enum category : String
{
    case Story = "Story"
    case History = "History"
    case Poem = "Poem"
    case Novel = "Novel"
    case Essay = "Essay"
    case Other = "Other"
    
}

public struct Book {
    
    var name: String
    var image: String
    var writer: String
    var publication: String
    var category : String
    var price : String
    var releaseDate: String
    var edition: String
    
    public init(name: String, image: String, writer: String, publication: String, category: String, price: String, releaseDate: String, edition: String ) {
        self.name = name
        self.image = image;
        self.writer = writer
        self.publication = publication
        self.category = category
        self.price = price
        self.releaseDate = releaseDate
        self.edition = edition
        
    }
}

var book1 = Book(name: "রত্ন দ্বীপ", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/7085f5a42614_117473.gif", writer: "আবুল আসাদ", publication: "বাংলা সাহিত্য পরিষদ", category: category.Story.rawValue, price: "115", releaseDate: "01/01/2019", edition: "1st")

var book2 = Book(name: "নিশীথিনী", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/1d7737440_1280.jpg", writer: "হুমায়ূন আহমেদ", publication: "প্রতীক প্রকাশনা সংস্থা", category: category.Story.rawValue, price: "150", releaseDate: "01/01/2019", edition: "1st")

var book3 = Book(name: "বাংলাদেশ : রক্তের ঋণ", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/img_45787.GIF", writer: "অ্যান্থনী ম্যাসকারেনহাস ", publication: "হাক্কানী পাবলিশার্স ", category: category.History.rawValue, price: "1040", releaseDate: "01/01/2019", edition: "1st")

var book4 = Book(name: "নিম্নবর্গের ইতিহাস", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/f2cdf3ade_43914.jpg", writer: "গৌতম ভদ্র , ড. পার্থ চট্টোপাধ্যায় ", publication: "আনন্দ পাবলিশার্স (ভারত) ", category: category.History.rawValue, price: "1120", releaseDate: "01/01/2019", edition: "1st")

var book5 = Book(name: "কবিকে নিয়ে কবিতা", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/8347718b3934_111320.gif", writer: "নাওশেবা সবিহ কবিতা", publication: " টইটম্বুর ", category: category.Poem.rawValue, price: "230", releaseDate: "01/01/2019", edition: "1st")

var book6 = Book(name: "কবিতায় কবিতা", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/e815b327b214_81609.png",  writer: "নাওশেবা সবিহ কবিতা", publication: " টইটম্বুর ", category: category.Poem.rawValue, price: "120", releaseDate: "01/01/2019", edition: "1st")

var book7 = Book(name: "ব্ল্যাক হোলের বাচ্চা", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/2aed6380e_62146.jpg", writer: "মুহম্মদ জাফর ইকবাল", publication: "সময় প্রকাশন ", category: category.Novel.rawValue, price: "1350", releaseDate: "01/01/2019", edition: "1st")

var book8 = Book(name: "মিসির আলি সমগ্র-১", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/1d3988f5b104_56.gif", writer: "হুমায়ূন আহমেদ ", publication: "অনন্যা", category: category.Novel.rawValue, price: "1300", releaseDate: "01/01/2019", edition: "1st")

var book9 = Book(name: "দ্য ভিঞ্চি কোড", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/04b342e2d174_26394.jpg", writer: "ড্যান ব্রাউন", publication: "বাতিঘর প্রকাশনী ", category: category.Essay.rawValue, price: "546", releaseDate: "01/01/2019", edition: "1st")

var book10 = Book(name: "মোসাদ", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/acedfde89b54_131663.jpg", writer: "মাইকেল বার-জোহর , নিসিম মিশাল", publication: "আবিষ্কার পাবলিকেশন ", category: category.Essay.rawValue, price: "667",releaseDate: "01/01/2019", edition: "1st")

var book11 = Book(name: "সাকসেস থ্রো এ পজেটিভ মেন্টাল এটিটিউট", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/bda64bedc_152701.jpg", writer: "নেপোলিয়ন হিল", publication: "সাফল্য প্রকাশনী", category: category.Other.rawValue, price: "545", releaseDate: "01/01/2019", edition: "1st")

var book12 = Book(name: "টাইম ম্যানেজমেন্ট", image: "https://s3-ap-southeast-1.amazonaws.com/rokomari110/productNew/260X372/f22707806_154373.jpg", writer: "ব্রায়ান ট্রেসি", publication: "সাফল্য প্রকাশনী", category: category.Other.rawValue, price: "895", releaseDate: "01/01/2019", edition: "1st")




public var Booklist : [Book] = [ book1, book2, book3, book4, book5, book6, book7, book8, book9, book10, book11, book12]


