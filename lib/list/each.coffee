define ['util/typeOf'], (typeOf) ->
  arylike = ['array', 'arraylike', 'string']

  # iterates array, object, string or arraylike object `list` with `iterator`,
  # optionally changing the context of `iterator` from `list` to `context`
  # returns `list`
  (list, iterator, context = list) ->
    type = typeOf list

    if type in arylike
      iterator.call context, item, i, list for item, i in list when list[i]

    else if type is 'object'
      iterator.call context, val, key, list for own key, val of list

    list

