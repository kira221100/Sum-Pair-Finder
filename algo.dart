// Below has Complexity of O(n), in contrast to the forLoop method which goes upto O(n^2)..

//And if we use A list instead of a map to store the seenNumbers in the iteration(forLoop), the the complexity would still be O(n^2) because of the nested loop to check the current number in the List we use to store the already iterated element.
main() {
  List<int> nums = [2, 7, 66, 15];

  int target = 18;
  print(algorithm1(nums, target));
}

List<dynamic> algorithm1(List<dynamic> nums, int target) {
  Map<int, int> already_iteratedNumbers = {};

  for (int i = 0; i < nums.length; i++) {
    int num = nums[i];
    int remaining = target - num;

    if (already_iteratedNumbers.containsKey(remaining)) {
      // return [remaining, nums[i]];
      return [already_iteratedNumbers[remaining], i];
    }

    already_iteratedNumbers[num] = i;
  }

  return ["The Numbers that sum up to $target doesnt exist"];
}

//-------------------------------------------------------------

///For time complexity, the below method is inferior to the other solution(HashMap method O(n) ) as it has Complexity of O(nlogn) due to the sorting step BUt in case of space complexity it has Complexity of O(1) and hash map has space complexity of O(n) as it needs to store hashmap.

//I Had major help for this method.....
//Need to sort beforehand....

List<dynamic> algorithm(List<int> nums, int target) {
  List<int> answerList = [];
  int minIndex = 0;
  int maxIndex = nums.length - 1;
  nums.sort();

  while (minIndex < maxIndex) {
    int sum = nums[minIndex] + nums[maxIndex];
    if (sum == target) {
      answerList = [minIndex, maxIndex];
      //   answerList = [nums[minIndex], nums[maxIndex]];
      return answerList;
    } else if (sum < target) {
      minIndex++;
    } else {
      maxIndex--;
    }
  }

  return ["The Numbers that sums up to $target doesn't exist"];
}

//----------------------------------------------------------------

//Looping the whole Given List to find the summed pair...
//Complexity of the method: O(n^2):

List<dynamic> algorithm2(List<dynamic> nums, int target) {
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] + nums[j] == target) {
        // return [nums[i], nums[j]];
        return [i, j];
      }
    }
  }

  return ["The numbers that sums up to $target doesn't exist"];
}









//BELOW DOESN't work.(Iniital dry run solution)


// main() {
//   List nums = [2, 7, 11, 15];

//   int target = 17;
//   print(algorithm(nums, target));
// }

// List algorithm(List nums, int target) {
//   List answerList = [];
//   int minIndex = 0;
//   int maxIndex = nums.length - 1;
// //   List AnswerList = [];
//   while (answerList.isEmpty) {
//     int mid = ((minIndex + maxIndex) / 2).floor();
//     print('checkpoint1');
//     if (target - nums[mid] > nums[mid]) {
//       minIndex = mid;
//       //   int first_Sum_element = nums[mid];
//       for (int i = mid; i <= maxIndex; i++) {
//         for (int j = mid; j <= maxIndex - 1; j++) {
//           if (nums[i] + nums[j] == target) {
//             print('checkpoint2');
//             answerList = [nums[i], nums[j]];
//             return answerList;
//           }
//         }
//       }

//       return ["The Numbers that sum up to $target doesnt exist"];
//     } else if (target - nums[mid] < nums[mid]) {
//       maxIndex = mid;
//       for (int i = minIndex; i <= maxIndex; i++) {
//         for (int j = minIndex; j <= maxIndex - 1; j++) {
//           if (nums[i] + nums[j] == target) {
//             print('checkpoint3');
//             answerList = [nums[i], nums[j]];
//             return answerList;
//           }
//         }
//       }

//       return ["The Numbers that sum up to $target doesnt exist"];
//     }
//     if (minIndex >= maxIndex) break;
//   }
//   return [''];
// }
