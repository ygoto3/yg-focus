angular.module("yg-focus", [])
.directive 'ygFocus', ->
  restrict: "A"
  link: (iScope, iElem) ->
    iScope.$evalAsync(
      ->
        iElem[0].focus()
        return
    )
    return
