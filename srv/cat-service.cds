using my.bookshop as my from '../db/data-model';
using V_RESULTS as Cview from '../db/data-model';

service CatalogService @(requires : 'authenticated-user') {
    entity Author @(restrict : [{
        grant : [
            'READ',
            'CREATE',
            'DELETE',
            'UPDATE'
        ],
        to    : 'authenticated-user'
    }]) as projection on my.Author;

    entity Books @(restrict : [{
        grant : [
            'READ',
            'CREATE',
            'DELETE',
            'UPDATE'
        ],
        to    : 'authenticated-user'
    }]) as projection on my.Books;

    entity V_RESULTS as projection on Cview;
    type userScopes {
        identified    : Boolean;
        authenticated : Boolean;
        User          : Boolean;
        Admin         : Boolean;
    };

    type user {
        user   : String;
        locale : String;
        scopes : userScopes;
    };

    function userInfo() returns user;
}
