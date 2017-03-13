-module(graphql_introspection_test).
-include_lib("eunit/include/eunit.hrl").
-include("types.hrl").

query() -> <<"
  query IntrospectionQuery {
    __schema {
      queryType { name }
      mutationType { name }
      subscriptionType { name }
      types {
        ...FullType
      }
      directives {
        name
        description
        locations
        args {
          ...InputValue
        }
      }
    }
  }

  fragment FullType on __Type {
    kind
    name
    description
    fields(includeDeprecated: true) {
      name
      description
      args {
        ...InputValue
      }
      type {
        ...TypeRef
      }
      isDeprecated
      deprecationReason
    }
    inputFields {
      ...InputValue
    }
    interfaces {
      ...TypeRef
    }
    enumValues(includeDeprecated: true) {
      name
      description
      isDeprecated
      deprecationReason
    }
    possibleTypes {
      ...TypeRef
    }
  }

  fragment InputValue on __InputValue {
    name
    description
    type { ...TypeRef }
    defaultValue
  }

  fragment TypeRef on __Type {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
                ofType {
                  kind
                  name
                }
              }
            }
          }
        }
      }
    }
  }
">>.

expect() -> #{data => [{<<"__schema">>,
  [{<<"queryType">>,[{<<"name">>,<<"QueryRoot">>}]},
    {<<"mutationType">>,null},
    {<<"subscriptionType">>,null},
    {<<"types">>,
      [[{<<"kind">>,<<"OBJECT">>},
        {<<"name">>,<<"__Directive">>},
        {<<"description">>,<<"Directive Introspection">>},
        {<<"fields">>,
          [[{<<"name">>,<<"name">>},
            {<<"description">>,null},
            {<<"args">>,[]},
            {<<"type">>,
              [{<<"kind">>,<<"SCALAR">>},
                {<<"name">>,<<"String">>},
                {<<"ofType">>,null}]},
            {<<"isDeprecated">>,<<"false">>},
            {<<"deprecationReason">>,null}],
            [{<<"name">>,<<"__typename">>},
              {<<"description">>,<<"Name of current type">>},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"SCALAR">>},
                  {<<"name">>,<<"String">>},
                  {<<"ofType">>,null}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}]]},
        {<<"inputFields">>,null},
        {<<"interfaces">>,[]},
        {<<"enumValues">>,null},
        {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"EnumValue">>},
          {<<"description">>,<<"Enumerate value">>},
          {<<"fields">>,
            [[{<<"name">>,<<"name">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"SCALAR">>},
                  {<<"name">>,<<"String">>},
                  {<<"ofType">>,null}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"isDeprecated">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"Boolean">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"description">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"deprecationReason">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"__InputValue">>},
          {<<"description">>,<<"InputValue Introspection">>},
          {<<"fields">>,
            [[{<<"name">>,<<"type">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"OBJECT">>},
                  {<<"name">>,<<"__Type">>},
                  {<<"ofType">>,null}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"name">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"description">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"defaultValue">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"Int">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"__Field">>},
          {<<"description">>,<<"Field Introspection">>},
          {<<"fields">>,
            [[{<<"name">>,<<"type">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"OBJECT">>},
                  {<<"name">>,<<"__Type">>},
                  {<<"ofType">>,null}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"name">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"isDeprecated">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"description">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"deprecationReason">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"args">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"LIST">>},
                    {<<"name">>,null},
                    {<<"ofType">>,
                      [{<<"kind">>,<<"OBJECT">>},
                        {<<"name">>,<<"__InputValue">>},
                        {<<"ofType">>,null}]}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"__Type">>},
          {<<"description">>,<<"Type Introspection">>},
          {<<"fields">>,
            [[{<<"name">>,<<"possibleTypes">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"LIST">>},
                  {<<"name">>,null},
                  {<<"ofType">>,
                    [{<<"kind">>,<<"OBJECT">>},
                      {<<"name">>,<<"__Type">>},
                      {<<"ofType">>,null}]}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"ofType">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"OBJECT">>},
                    {<<"name">>,<<"__Type">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"name">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"kind">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"interfaces">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"LIST">>},
                    {<<"name">>,null},
                    {<<"ofType">>,
                      [{<<"kind">>,<<"SCALAR">>},
                        {<<"name">>,<<"Int">>},
                        {<<"ofType">>,null}]}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"inputFields">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"LIST">>},
                    {<<"name">>,null},
                    {<<"ofType">>,
                      [{<<"kind">>,<<"SCALAR">>},
                        {<<"name">>,<<"Int">>},
                        {<<"ofType">>,null}]}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"fields">>},
                {<<"description">>,null},
                {<<"args">>,
                  [[{<<"name">>,<<"includeDeprecated">>},
                    {<<"description">>,null},
                    {<<"type">>,
                      [{<<"kind">>,<<"SCALAR">>},
                        {<<"name">>,<<"Boolean">>},
                        {<<"ofType">>,null}]},
                    {<<"defaultValue">>,null}]]},
                {<<"type">>,
                  [{<<"kind">>,<<"LIST">>},
                    {<<"name">>,null},
                    {<<"ofType">>,
                      [{<<"kind">>,<<"OBJECT">>},
                        {<<"name">>,<<"__Field">>},
                        {<<"ofType">>,null}]}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"enumValues">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"LIST">>},
                    {<<"name">>,null},
                    {<<"ofType">>,
                      [{<<"kind">>,<<"OBJECT">>},
                        {<<"name">>,<<"EnumValue">>},
                        {<<"ofType">>,null}]}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"description">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"__Schema">>},
          {<<"description">>,<<"Schema Introspection">>},
          {<<"fields">>,
            [[{<<"name">>,<<"types">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"LIST">>},
                  {<<"name">>,null},
                  {<<"ofType">>,
                    [{<<"kind">>,<<"OBJECT">>},
                      {<<"name">>,<<"__Type">>},
                      {<<"ofType">>,null}]}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"subscriptionType">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"OBJECT">>},
                    {<<"name">>,<<"__Type">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"queryType">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"OBJECT">>},
                    {<<"name">>,<<"__Type">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"mutationType">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"OBJECT">>},
                    {<<"name">>,<<"__Type">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"directives">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"LIST">>},
                    {<<"name">>,null},
                    {<<"ofType">>,
                      [{<<"kind">>,<<"OBJECT">>},
                        {<<"name">>,<<"__Directive">>},
                        {<<"ofType">>,null}]}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"ENUM">>},
          {<<"name">>,<<"Test">>},
          {<<"description">>,<<"Test description">>},
          {<<"fields">>,[]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,
            [[{<<"name">>,<<"ONE">>},
              {<<"description">>,
                <<"This is 1 represent as text">>},
              {<<"isDeprecated">>,false},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"TWO">>},
                {<<"description">>,
                  <<"This is 2 represent as text">>},
                {<<"isDeprecated">>,false},
                {<<"deprecationReason">>,null}]]},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"SCALAR">>},
          {<<"name">>,<<"Float">>},
          {<<"description">>,
            <<"The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](http://en.wikipedia.org/wiki/IEEE_floating_point).">>},
          {<<"fields">>,[]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"SCALAR">>},
          {<<"name">>,<<"Int">>},
          {<<"description">>,
            <<"The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^53 - 1) and 2^53 - 1 since represented in JSON as double-precision floating point numbers specified by [IEEE 754](http://en.wikipedia.org/wiki/IEEE_floating_point).">>},
          {<<"fields">>,[]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"CustomObject3">>},
          {<<"description">>,
            <<"Test Object introspection in list">>},
          {<<"fields">>,
            [[{<<"name">>,<<"boolean">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"SCALAR">>},
                  {<<"name">>,<<"Boolean">>},
                  {<<"ofType">>,null}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"CustomObject2">>},
          {<<"description">>,
            <<"Test Object introspection in list">>},
          {<<"fields">>,
            [[{<<"name">>,<<"boolean">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"SCALAR">>},
                  {<<"name">>,<<"Boolean">>},
                  {<<"ofType">>,null}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"SCALAR">>},
          {<<"name">>,<<"String">>},
          {<<"description">>,
            <<"The `String` scalar type represents textual data, represented as UTF-8character sequences. The String type is most often used by GraphQL torepresent free-form human-readable text.">>},
          {<<"fields">>,[]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"SCALAR">>},
          {<<"name">>,<<"Boolean">>},
          {<<"description">>,
            <<"The `Boolean` scalar type represents `true` or `false`.">>},
          {<<"fields">>,[]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"CustomObject">>},
          {<<"description">>,
            <<"Test Object introspection in list">>},
          {<<"fields">>,
            [[{<<"name">>,<<"boolean">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"SCALAR">>},
                  {<<"name">>,<<"Boolean">>},
                  {<<"ofType">>,null}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}],
        [{<<"kind">>,<<"UNION">>},
          {<<"name">>,<<"UnionTest">>},
          {<<"description">>,<<"Test union">>},
          {<<"fields">>,[]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,
            [[{<<"kind">>,<<"OBJECT">>},
              {<<"name">>,<<"CustomObject">>},
              {<<"ofType">>,null}],
              [{<<"kind">>,<<"OBJECT">>},
                {<<"name">>,<<"CustomObject2">>},
                {<<"ofType">>,null}],
              [{<<"kind">>,<<"OBJECT">>},
                {<<"name">>,<<"CustomObject3">>},
                {<<"ofType">>,null}]]}],
        [{<<"kind">>,<<"OBJECT">>},
          {<<"name">>,<<"QueryRoot">>},
          {<<"description">>,<<"Test Query">>},
          {<<"fields">>,
            [[{<<"name">>,<<"union">>},
              {<<"description">>,null},
              {<<"args">>,[]},
              {<<"type">>,
                [{<<"kind">>,<<"UNION">>},
                  {<<"name">>,<<"UnionTest">>},
                  {<<"ofType">>,null}]},
              {<<"isDeprecated">>,<<"false">>},
              {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"string">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"object_list">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"LIST">>},
                    {<<"name">>,null},
                    {<<"ofType">>,
                      [{<<"kind">>,<<"OBJECT">>},
                        {<<"name">>,<<"CustomObject">>},
                        {<<"ofType">>,null}]}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"non_null">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"NON_NULL">>},
                    {<<"name">>,null},
                    {<<"ofType">>,
                      [{<<"kind">>,<<"SCALAR">>},
                        {<<"name">>,<<"Int">>},
                        {<<"ofType">>,null}]}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"integer">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"Int">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"float">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"Float">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"enums_args">>},
                {<<"description">>,null},
                {<<"args">>,
                  [[{<<"name">>,<<"int">>},
                    {<<"description">>,null},
                    {<<"type">>,
                      [{<<"kind">>,<<"ENUM">>},
                        {<<"name">>,<<"Test">>},
                        {<<"ofType">>,null}]},
                    {<<"defaultValue">>,null}]]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"Int">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"boolean">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"Boolean">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__typename">>},
                {<<"description">>,<<"Name of current type">>},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"SCALAR">>},
                    {<<"name">>,<<"String">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}],
              [{<<"name">>,<<"__schema">>},
                {<<"description">>,null},
                {<<"args">>,[]},
                {<<"type">>,
                  [{<<"kind">>,<<"OBJECT">>},
                    {<<"name">>,<<"__Schema">>},
                    {<<"ofType">>,null}]},
                {<<"isDeprecated">>,<<"false">>},
                {<<"deprecationReason">>,null}]]},
          {<<"inputFields">>,null},
          {<<"interfaces">>,[]},
          {<<"enumValues">>,null},
          {<<"possibleTypes">>,null}]]},
    {<<"directives">>,[]}]}],
  errors => []}.

schema() ->
  graphql_type_schema:new(#{
    query => fun queryRoot/0
  }).

queryRoot() -> graphql:objectType(<<"QueryRoot">>, <<"Test Query">>, #{
  <<"boolean">> => #{type => ?BOOLEAN},
  <<"string">> => #{type => ?STRING},
  <<"integer">> => #{type => ?INT},
  <<"float">> => #{type => ?FLOAT},
  <<"non_null">> => #{type => ?NON_NULL(?INT)},
  <<"object_list">> => #{type => ?LIST(fun object/0)},
  <<"enums_args">> => #{
    type => ?INT,
    args => #{
      <<"int">> => #{ type => fun enum_two/0}
    }
  },
  <<"union">> => #{
    type => ?UNION(<<"UnionTest">>, <<"Test union">>, [
      fun object/0,
      fun object2/0,
      fun object3/0
    ])
  }
}).

object() -> graphql:objectType(<<"CustomObject">>, <<"Test Object introspection in list">>, #{
  <<"boolean">> => #{type => ?BOOLEAN}
}).

object2() -> graphql:objectType(<<"CustomObject2">>, <<"Test Object introspection in list">>, #{
  <<"boolean">> => #{type => ?BOOLEAN}
}).
object3() -> graphql:objectType(<<"CustomObject3">>, <<"Test Object introspection in list">>, #{
  <<"boolean">> => #{type => ?BOOLEAN}
}).


enum_two() ->
  ?ENUM(<<"Test">>, <<"Test description">>, [
    ?ENUM_VAL(1, <<"ONE">>, <<"This is 1 represent as text">>),
    ?ENUM_VAL(1, <<"TWO">>, <<"This is 2 represent as text">>)
  ]).

introspection_test()->
  ?assertEqual(
    expect(),
    graphql:execute(schema(), query(), #{})
  ).
