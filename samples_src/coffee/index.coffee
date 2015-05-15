angular.module 'samples', ['yg-focus']
.controller 'SampleCtrl', [
  '$scope'
  (
    $scope
  ) ->
    $scope.items = []

    $scope.addInput = ->
      $scope.items.push(
        placeholder: 'Now focused!'
      )

      prevItem = $scope.items[$scope.items.length - 2]
      if prevItem
        prevItem.placeholder = 'Focus has been already removed from me.'
      return

    return
]
