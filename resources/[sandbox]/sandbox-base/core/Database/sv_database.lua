--- Mysql Database
--@class MYSQL.Exports
--
-- You can use this export methods: INSERT,QUERY,SCALAR,SINGLE,UPDATE
--@note Those functions must also be called for async, only then the name is MYSQL.ASYNC
-- For example: MYSQL.ASYNC:Insert
COMPONENTS.MYSQL = {
    _protected = true,
    _required = { 'Insert','Query','Scalar','Single','Update' },
    _name = 'base',
    --- Insert
    -- 
    -- This is how you can use the insert command.
    -- @example
    --  MYSQL:Insert('INSERT INTO users (identifier, firstname, lastname) VALUES (?, ?, ?)', {playerIdentifier, firstName, lastName}, function(id)
    --   print(id)
    --  end)
    --
    -- @tparam table self obj
    -- @tparam string query SQL query
    -- @tparam table params {playerIdentifier, firstName, lastName}
    -- @tparam function  cb callback function
    -- @rename MYSQL:Insert
    Insert = function(self,query,params,cb)
      exports[GetCurrentResourceName()]:insert(query,params,cb)
    end,
    --- Query
    -- 
    -- This is how you can use the query command.
    -- @example
    --  MYSQL:Query('SELECT * FROM users WHERE identifier = ?', {playerIdentifier}, function(result)
    --    if result then
    --        for _, v in pairs(result) do
    --            print(v.identifier, v.firstname, v.lastname)
    --        end
    --    end
    -- end)
    --
    -- @tparam table self obj
    -- @tparam string query SQL query
    -- @tparam table params {playerIdentifier, firstName, lastName}
    -- @tparam function  cb callback function
    -- @rename MYSQL:Query
    Query = function(self,query,params,cb)
      exports[GetCurrentResourceName()]:query(query,params,cb)
    end,
    --- Scalar
    -- 
    -- This is how you can use the scalar command.
    -- @example
    --  MYSQL:Scalar('SELECT firstname FROM users WHERE identifier = ?', {playerIdentifier}, function(firstname)
    --     print(firstname)
    --  end)
    --
    -- @tparam table self obj
    -- @tparam string query SQL query
    -- @tparam table params {playerIdentifier, firstName, lastName}
    -- @tparam function  cb callback function
    -- @rename MYSQL:Scalar
    Scalar = function(self,query,params,cb)
      exports[GetCurrentResourceName()]:scalar(query,params,cb)
    end,
    --- Single
    -- 
    -- This is how you can use the single command.
    -- @example
    --  MYSQL:Single('SELECT * FROM users WHERE identifier = ?', {playerIdentifier}, function(result)
    --     if result then
    --         print(result.identifier, result.firstname, result.lastname)
    --     end
    --  end)
    --
    -- @tparam table self obj
    -- @tparam string query SQL query
    -- @tparam table params {playerIdentifier, firstName, lastName}
    -- @tparam function  cb callback function
    -- @rename MYSQL:Single
    Single = function(self,query,params,cb)
      exports[GetCurrentResourceName()]:single(query,params,cb)
    end,
    --- Update
    --
    -- This is how you can use the update command. 
    -- @example
    --  MYSQL:Update('UPDATE users SET firstname = ? WHERE identifier = ?', {newName, playerIdentifier}, function(affectedRows)
    --     if affectedRows then
    --         print(affectedRows)
    --     end
    --  end)
    --
    -- This is how you can use the update command.
    -- @tparam table self obj
    -- @tparam string query SQL query
    -- @tparam table params {playerIdentifier, firstName, lastName}
    -- @tparam function  cb callback function
    -- @rename MYSQL:Update
    Update = function(self,query,params,cb)
      exports[GetCurrentResourceName()]:update(query,params,cb)
    end
}

COMPONENTS.MYSQL.Async = {
  Insert = function(self,query,params)
      return exports[GetCurrentResourceName()]:insert_async(query,params)
  end,
  Query = function(self,query,params)
      return exports[GetCurrentResourceName()]:query_async(query,params)
  end,
  Scalar = function(self,query,params)
      return exports[GetCurrentResourceName()]:scalar_async(query,params)
  end,
  Single = function(self,query,params)
      exports[GetCurrentResourceName()]:single_async(query,params)
  end,
  Update = function(self,query,params)
      exports[GetCurrentResourceName()]:update_async(query,params)
  end,
}


RegisterCommand("sql",function(source, args,rawCommand)
  print("sql test")
  -- COMPONENTS.MYSQL:Query('INSERT INTO ncs_items (name,label,weight) VALUES (?,?,?)',{'hamburger','hambi',1}, function(success)
  --   print(success)
  -- end)

  --COMPONENTS.MYSQL.ASYNC:Insert('INSERT INTO ncs_items (name,label,weight) VALUES (?,?,?)',{'cola','kóla',1})
end)