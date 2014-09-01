'use strict'

exports.add = (arr) ->
  [result] = [0].concat(arr).reduceRight (([acc, c], d) ->
    x = d + c
    return [[(x % 10)].concat(acc), Math.floor(x/10)]
  ), [[], 1]

  while result.length && !result[0]
    result.shift()

  return result
