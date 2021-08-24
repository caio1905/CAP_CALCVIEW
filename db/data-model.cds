// namespace my.bookshop;
context my.bookshop {
    entity Author {
        key IDA  : Integer;
            name : String;
            Book : Association to many Books
                       on Book.IDA = IDA;
    }

    entity Books {
        key ID    : Integer;
        key IDA   : Integer;
            title : String;
            stock : Decimal(12, 2);
    }
}

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_RESULTS] {
key     ![IDA]: Integer  @title: 'IDA: IDA' ; 
key     ![NAME]: String(5000)  @title: 'NAME: NAME' ; 
key     ![ID]: Integer  @title: 'ID: ID' ; 
key     ![TITLE]: String(5000)  @title: 'TITLE: TITLE' ; 
key     ![STOCK]: Decimal(12, 2)  @title: 'STOCK: STOCK' ; 
}