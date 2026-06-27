local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local function repository_var(args)
  local repo = args[1][1]
  return repo:sub(1, 1):lower() .. repo:sub(2)
end

return {
  s(
    "uc",
    fmt(
      [[
import 'package:dartz/dartz.dart';
import 'package:ewallet/core/common/base/base_usecase.dart';
import 'package:ewallet/core/errors/failure.dart';

class {} extends UseCase<{}, {}> {{
  final {} {};

  {}({{required this.{}}});

  @override
  Future<Either<Failure, {}>> call(
    {} params,
  ) async {{
    {}
  }}
}}
]],
      {
        -- 1
        i(1, "GetUserUseCase"),

        -- 2
        i(2, "User"),

        -- 3
        i(3, "NoParams"),

        -- 4
        i(4, "UserRepository"),

        -- derived variable name
        f(repository_var, { 4 }),

        -- class name
        f(function(args)
          return args[1][1]
        end, { 1 }),

        -- repository variable
        f(repository_var, { 4 }),

        -- return type
        f(function(args)
          return args[1][1]
        end, { 2 }),

        -- params type
        f(function(args)
          return args[1][1]
        end, { 3 }),

        -- 5 (final cursor position)
        i(5),
      }
    )
  ),
}
