using {app13.db as db} from '../db/data-model';













service CatalogService @(path : '/catalog')
@(requires: 'authenticated-user')
{
    entity Sales
      as select * from db.Sales
      actions {
        action boost() returns Sales;
      }
    ;














    type userScopes { identified: Boolean; authenticated: Boolean; ExtendCDS: Boolean; ExtendCDSdelete: Boolean;};
    type userType { user: String; locale: String; tenant: String; scopes: userScopes; };
    function userInfo() returns userType;


};