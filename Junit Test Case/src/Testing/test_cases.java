package Testing;
import static org.junit.jupiter.api.Assertions.*;
import java.util.ArrayList;
import java.util.List;


import org.junit.Assert;
import org.junit.jupiter.api.Test;

class test_cases {
	/*
	 * This test is a simple test for an unsorted list
	 */
	@Test
	void test() {
		sortingComparison test = new sortingComparison();
		int arr[] = {23,154,34,12,765};
		int arr2[] = {12,23,34,154,765};
		test.bubbleSort(arr);
		assertArrayEquals(arr,arr2);
	}
	
	/*
	 * This tests for an empty list and makes sure it runs.
	 */
	
	@Test
	void test2() {
		sortingComparison test2 = new sortingComparison();
		int arr3[] = {};
		int arr4[]= {};
		test2.bubbleSort(arr3);
		assertArrayEquals(arr3,arr4);
	}
	
	/*
	 * This is a test for negative numbers in the array.
	 */
	
	@Test
	void test3() {
		sortingComparison test3 = new sortingComparison();
		int arr[] = {-4,-12,-54,0,24,17};
		int arr2[] = {-54,-12,-4,0,17,24};
		test3.bubbleSort(arr);
		assertArrayEquals(arr2, arr);
	}
	
	@Test
	/*
	 * This tests for very large numbers within the array. This one failed.
	 */
	void test4() {
		sortingComparison test4 = new sortingComparison();
		int arr[] = {1000000,564665555,2000000,3};
		int arr2[] = {3,1000000,2000000,564665555};
		test4.bubbleSort(arr);
		assertArrayEquals(arr2,arr);
	}
	
	@Test
	/*
	 * This one tests for very small numbers within the array.
	 */
	void test5() {
		sortingComparison test5 = new sortingComparison();
		int arr[] = {1,5,3,2,4,8,7};
		int arr2[] = {1,2,3,4,5,7,8};
		test5.bubbleSort(arr);
		assertArrayEquals(arr2,arr);
	}
	
	@Test
	/*
	 * This one tests for a list that is already sorted.
	 */
	void test6() {
		sortingComparison test6 = new sortingComparison();
		int arr[] = {0,1,2,3,4,5};
		int arr2[] = {0,1,2,3,4,5};
		test6.bubbleSort(arr);
		assertArrayEquals(arr,arr2);
		
	}
	
	@Test
	/* This one tests for a list that is in reverse sorted order.
	 * this one failed
	 */
	void test7() {
		sortingComparison test7 = new sortingComparison();
		int arr[] = {5,4,3,2,1,0};
		int arr2[] = {0,1,2,3,4,5};
		test7.bubbleSort(arr);
		assertArrayEquals(arr,arr2);
	
	}
	
	@Test
	/*
	 * this one tests for one digit being incorrect.
	 */
	void test8() {
		sortingComparison test8 = new sortingComparison();
		int arr[] = {1,2,3,5,4,6};
		int arr2[] = {1,2,3,4,5,6};
		test8.bubbleSort(arr);
		assertArrayEquals(arr,arr2);
	
	}
	
	@Test
	/*
	 * this one tests for an array that has many multiples of the same value -- especially zero.
	 */
	void test9() {
		sortingComparison test9 = new sortingComparison();
		int arr[] = {0,0,0,1,2,0,0};
		int arr2[] = {0,0,0,0,0,1,2};
		test9.bubbleSort(arr);
		assertArrayEquals(arr,arr2);
	}
	
	@Test
	
	/*
	 * This tests a large variance in number including negatives.
	 * This one fails.
	 */
	
	void test10() {
		sortingComparison test10 = new sortingComparison();
		int arr[] = {10000,0,-1000000,1000000,-10000};
		int arr2[] = {-1000000,-10000,0,10000,1000000};
		test10.bubbleSort(arr);
		assertArrayEquals(arr,arr2);
	}

	/*
	 * THIS IS WHERE FASTBUBBLESORT TESTS START
	 * 
	 * This test is a simple test for an unsorted Arraylist
	 */
	@Test
	void test11() {
		sortingComparison test11 = new sortingComparison();
		ArrayList<Integer> arr = new ArrayList<>();
			arr.add(23);
			arr.add(154);
			arr.add(34);
			arr.add(12);
			arr.add(765);
		ArrayList<Integer> arr2 = new ArrayList<>();
			arr2.add(12);
			arr2.add(23);
			arr2.add(34);
			arr2.add(154);
			arr2.add(765);
		test11.fastBubbleSort(arr);
		assertArrayEquals(arr.toArray(),arr2.toArray());
	}

	
	/*
	 * This tests for an empty list and makes sure it runs.
	 */
	
	@Test
	void test12() {
		sortingComparison test12 = new sortingComparison();
	ArrayList<Integer> arr3 = new ArrayList<>();
	ArrayList<Integer> arr4 = new ArrayList<>();
	test12.fastBubbleSort(arr3);
	assertArrayEquals(arr3.toArray(),arr4.toArray());
	}
	
	/*
	 * This is a test for negative numbers in the array.
	 */
	
	@Test
	void test13() {
		sortingComparison test13 = new sortingComparison();
	ArrayList<Integer> arr5 = new ArrayList<>();
		arr5.add(-4);
		arr5.add(-12);
		arr5.add(-54);
		arr5.add(0);
		arr5.add(24);
		arr5.add(17);
	ArrayList<Integer> arr6 = new ArrayList<>();
		arr6.add(-54);
		arr6.add(-12);
		arr6.add(-4);
		arr6.add(0);
		arr6.add(17);
		arr6.add(24);
	test13.fastBubbleSort(arr5);
	assertArrayEquals(arr5.toArray(),arr6.toArray());
	}
	
	@Test
	/*
	 * This tests for very large numbers within the array. This one failed.
	 */
	void test14() {
		sortingComparison test14 = new sortingComparison();
	ArrayList<Integer> arr7 = new ArrayList<>();
		arr7.add(1000000);
		arr7.add(564665555);
		arr7.add(2000000);
		arr7.add(3);
	ArrayList<Integer> arr8 = new ArrayList<>();
		arr8.add(3);
		arr8.add(1000000);
		arr8.add(2000000);
		arr8.add(564665555);
	test14.fastBubbleSort(arr7);
	assertArrayEquals(arr7.toArray(),arr8.toArray());
	}
	
	@Test
	/*
	 * This one tests for very small numbers within the array.
	 */
	void test15() {
		sortingComparison test15 = new sortingComparison();
		ArrayList<Integer> arr9 = new ArrayList<>();
		arr9.add(1);
		arr9.add(5);
		arr9.add(3);
		arr9.add(2);
		arr9.add(4);
		arr9.add(8);
		arr9.add(7);
	ArrayList<Integer> arr10 = new ArrayList<>();
		arr10.add(1);
		arr10.add(2);
		arr10.add(3);
		arr10.add(4);
		arr10.add(5);
		arr10.add(7);
		arr10.add(8);
	test15.fastBubbleSort(arr9);
	assertArrayEquals(arr9.toArray(),arr10.toArray());
	}
	
	@Test
	/*
	 * This one tests for a list that is already sorted.
	 */
	void test16() {
		sortingComparison test16 = new sortingComparison();
		ArrayList<Integer> arr11 = new ArrayList<>();
		arr11.add(0);
		arr11.add(1);
		arr11.add(2);
		arr11.add(3);
		arr11.add(4);
		arr11.add(5);
	ArrayList<Integer> arr12 = new ArrayList<>();
		arr12.add(0);
		arr12.add(1);
		arr12.add(2);
		arr12.add(3);
		arr12.add(4);
		arr12.add(5);
	test16.fastBubbleSort(arr11);
	assertArrayEquals(arr11.toArray(),arr12.toArray());
		
	}
	
	@Test
	/* This one tests for a list that is in reverse sorted order.
	 * 
	 */
	void test17() {
		sortingComparison test17 = new sortingComparison();
		ArrayList<Integer> arr13 = new ArrayList<>();
		arr13.add(5);
		arr13.add(4);
		arr13.add(3);
		arr13.add(2);
		arr13.add(1);
		arr13.add(0);
	ArrayList<Integer> arr14 = new ArrayList<>();
		arr14.add(0);
		arr14.add(1);
		arr14.add(2);
		arr14.add(3);
		arr14.add(4);
		arr14.add(5);
	test17.fastBubbleSort(arr13);
	assertArrayEquals(arr13.toArray(),arr14.toArray());
	
	}
	
	@Test
	/*
	 * this one tests for one digit being incorrect.
	 */
	void test18() {
		sortingComparison test18 = new sortingComparison();
		ArrayList<Integer> arr15 = new ArrayList<>();
		arr15.add(1);
		arr15.add(2);
		arr15.add(3);
		arr15.add(5);
		arr15.add(4);
		arr15.add(6);
	ArrayList<Integer> arr16 = new ArrayList<>();
		arr16.add(1);
		arr16.add(2);
		arr16.add(3);
		arr16.add(4);
		arr16.add(5);
		arr16.add(6);
	test18.fastBubbleSort(arr15);
	assertArrayEquals(arr15.toArray(),arr16.toArray());
	
	}
	
	@Test
	/*
	 * this one tests for an array that has many multiples of the same value -- especially zero.
	 */
	void test19() {
		sortingComparison test19 = new sortingComparison();
		ArrayList<Integer> arr17 = new ArrayList<>();
		arr17.add(0);
		arr17.add(0);
		arr17.add(0);
		arr17.add(1);
		arr17.add(2);
		arr17.add(0);
		arr17.add(0);
	ArrayList<Integer> arr18 = new ArrayList<>();
		arr18.add(0);
		arr18.add(0);
		arr18.add(0);
		arr18.add(0);
		arr18.add(0);
		arr18.add(1);
		arr18.add(2);
	test19.fastBubbleSort(arr17);
	assertArrayEquals(arr17.toArray(),arr18.toArray());
	}
	
	@Test
	
	/*
	 * This tests a large variance in number including negatives.
	 *
	 */
	
	void test20() {
		sortingComparison test20 = new sortingComparison();
		ArrayList<Integer> arr19 = new ArrayList<>();
		arr19.add(-10000);
		arr19.add(0);
		arr19.add(-1000000);
		arr19.add(1000000);
		arr19.add(10000);
	ArrayList<Integer> arr20 = new ArrayList<>();
		arr20.add(-1000000);
		arr20.add(-10000);
		arr20.add(0);
		arr20.add(10000);
		arr20.add(1000000);
	test20.fastBubbleSort(arr19);
	assertArrayEquals(arr19.toArray(),arr20.toArray());
		
	}
	
	/*
	 * THIS IS WHERE INSERTION SORT TESTS START
	 * 
	 * This test is a simple test for an unsorted Arraylist
	 */
	@Test
	void test21() {
		sortingComparison test21 = new sortingComparison();
		ArrayList<Integer> arr21 = new ArrayList<>();
			arr21.add(23);
			arr21.add(154);
			arr21.add(34);
			arr21.add(12);
			arr21.add(765);
		ArrayList<Integer> arr22 = new ArrayList<>();
			arr22.add(12);
			arr22.add(23);
			arr22.add(34);
			arr22.add(154);
			arr22.add(765);
		test21.insertionSort(arr21);
		assertArrayEquals(arr21.toArray(),arr22.toArray());
	}

	
	/*
	 * This tests for an empty list and makes sure it runs.
	 */
	
	@Test
	void test22() {
		sortingComparison test22 = new sortingComparison();
	ArrayList<Integer> arr23 = new ArrayList<>();
	ArrayList<Integer> arr24 = new ArrayList<>();
	test22.insertionSort(arr23);
	assertArrayEquals(arr23.toArray(),arr24.toArray());
	}
	
	/*
	 * This is a test for negative numbers in the array.
	 */
	
	@Test
	void test23() {
		sortingComparison test23 = new sortingComparison();
	ArrayList<Integer> arr25 = new ArrayList<>();
		arr25.add(-4);
		arr25.add(-12);
		arr25.add(-54);
		arr25.add(0);
		arr25.add(24);
		arr25.add(17);
	ArrayList<Integer> arr26 = new ArrayList<>();
		arr26.add(-54);
		arr26.add(-12);
		arr26.add(-4);
		arr26.add(0);
		arr26.add(17);
		arr26.add(24);
	test23.insertionSort(arr25);
	assertArrayEquals(arr25.toArray(),arr26.toArray());
	}
	
	@Test
	/*
	 * This tests for very large numbers within the array. This one failed.
	 */
	void test24() {
		sortingComparison test24 = new sortingComparison();
	ArrayList<Integer> arr27 = new ArrayList<>();
		arr27.add(1000000);
		arr27.add(564665555);
		arr27.add(2000000);
		arr27.add(3);
	ArrayList<Integer> arr28 = new ArrayList<>();
		arr28.add(3);
		arr28.add(1000000);
		arr28.add(2000000);
		arr28.add(564665555);
	test24.insertionSort(arr27);
	assertArrayEquals(arr27.toArray(),arr28.toArray());
	}
	
	@Test
	/*
	 * This one tests for very small numbers within the array.
	 */
	void test25() {
		sortingComparison test25 = new sortingComparison();
		ArrayList<Integer> arr29 = new ArrayList<>();
		arr29.add(1);
		arr29.add(5);
		arr29.add(3);
		arr29.add(2);
		arr29.add(4);
		arr29.add(8);
		arr29.add(7);
	ArrayList<Integer> arr30 = new ArrayList<>();
		arr30.add(1);
		arr30.add(2);
		arr30.add(3);
		arr30.add(4);
		arr30.add(5);
		arr30.add(7);
		arr30.add(8);
	test25.insertionSort(arr29);
	assertArrayEquals(arr29.toArray(),arr30.toArray());
	}
	
	@Test
	/*
	 * This one tests for a list that is already sorted.
	 */
	void test26() {
		sortingComparison test26 = new sortingComparison();
		ArrayList<Integer> arr31 = new ArrayList<>();
		arr31.add(0);
		arr31.add(1);
		arr31.add(2);
		arr31.add(3);
		arr31.add(4);
		arr31.add(5);
	ArrayList<Integer> arr32 = new ArrayList<>();
		arr32.add(0);
		arr32.add(1);
		arr32.add(2);
		arr32.add(3);
		arr32.add(4);
		arr32.add(5);
	test26.insertionSort(arr31);
	assertArrayEquals(arr31.toArray(),arr32.toArray());
		
	}
	
	@Test
	/* This one tests for a list that is in reverse sorted order.
	 * 
	 */
	void test27() {
		sortingComparison test27 = new sortingComparison();
		ArrayList<Integer> arr33 = new ArrayList<>();
		arr33.add(5);
		arr33.add(4);
		arr33.add(3);
		arr33.add(2);
		arr33.add(1);
		arr33.add(0);
	ArrayList<Integer> arr34 = new ArrayList<>();
		arr34.add(0);
		arr34.add(1);
		arr34.add(2);
		arr34.add(3);
		arr34.add(4);
		arr34.add(5);
	test27.insertionSort(arr33);
	assertArrayEquals(arr33.toArray(),arr34.toArray());
	
	}
	
	@Test
	/*
	 * this one tests for one digit being incorrect.
	 */
	void test28() {
		sortingComparison test28 = new sortingComparison();
		ArrayList<Integer> arr35 = new ArrayList<>();
		arr35.add(1);
		arr35.add(2);
		arr35.add(3);
		arr35.add(5);
		arr35.add(4);
		arr35.add(6);
	ArrayList<Integer> arr36 = new ArrayList<>();
		arr36.add(1);
		arr36.add(2);
		arr36.add(3);
		arr36.add(4);
		arr36.add(5);
		arr36.add(6);
	test28.insertionSort(arr35);
	assertArrayEquals(arr35.toArray(),arr36.toArray());
	
	}
	
	@Test
	/*
	 * this one tests for an array that has many multiples of the same value -- especially zero.
	 */
	void test29() {
		sortingComparison test29 = new sortingComparison();
		ArrayList<Integer> arr37 = new ArrayList<>();
		arr37.add(0);
		arr37.add(0);
		arr37.add(0);
		arr37.add(1);
		arr37.add(2);
		arr37.add(0);
		arr37.add(0);
	ArrayList<Integer> arr38 = new ArrayList<>();
		arr38.add(0);
		arr38.add(0);
		arr38.add(0);
		arr38.add(0);
		arr38.add(0);
		arr38.add(1);
		arr38.add(2);
	test29.insertionSort(arr37);
	assertArrayEquals(arr37.toArray(),arr38.toArray());
	}
	
	@Test
	
	/*
	 * This tests a large variance in number including negatives.
	 *
	 */
	
	void test30() {
		sortingComparison test30 = new sortingComparison();
		ArrayList<Integer> arr39 = new ArrayList<>();
		arr39.add(-10000);
		arr39.add(0);
		arr39.add(-1000000);
		arr39.add(1000000);
		arr39.add(10000);
	ArrayList<Integer> arr40 = new ArrayList<>();
		arr40.add(-1000000);
		arr40.add(-10000);
		arr40.add(0);
		arr40.add(10000);
		arr40.add(1000000);
	test30.insertionSort(arr39);
	assertArrayEquals(arr39.toArray(),arr40.toArray());
		
	}
	/*
	 * THIS IS WHERE QUICKSORT TESTS START.
	 * 
	 * this test checks an simple unsorted list.
	 */
	@Test
	void test31() {
		sortingComparison test = new sortingComparison();
		int arr50[] = {23,154,34,12,765};
		int arr52[] = {12,23,34,154,765};
		int x = arr50.length - 1;
		test.quickSort(arr50, 0, x);
		assertArrayEquals(arr50,arr52);
	}
	/*
	 * this one tests an empty list
	 */

	@Test
	void test32() {
		sortingComparison test32 = new sortingComparison();
		int arr3[] = {};
		int arr4[]= {};
		test32.quickSort(arr3,0 ,arr3.length-1);
		assertArrayEquals(arr3,arr4);
	}
	
	/*
	 * This is a test for negative numbers in the array.
	 */
	
	@Test
	void test33() {
		sortingComparison test33 = new sortingComparison();
		int arr[] = {-4,-12,-54,0,24,17};
		int arr2[] = {-54,-12,-4,0,17,24};
		int x = arr.length - 1 ;
		test33.quickSort(arr,0,x);
		assertArrayEquals(arr2, arr);
	}
	
	@Test
	/*
	 * This tests for very large numbers within the array. This one failed.
	 */
	void test34() {
		sortingComparison test34 = new sortingComparison();
		int arr[] = {1000000,564665555,2000000,3};
		int arr2[] = {3,1000000,2000000,564665555};
		test34.quickSort(arr,0,arr.length-1);
		assertArrayEquals(arr2,arr);
	}
	
	@Test
	/*
	 * This one tests for very small numbers within the array.
	 */
	void test35() {
		sortingComparison test35 = new sortingComparison();
		int arr[] = {1,5,3,2,4,8,7};
		int arr2[] = {1,2,3,4,5,7,8};
		test35.quickSort(arr,0,arr.length-1);
		assertArrayEquals(arr2,arr);
	}
	
	@Test
	/*
	 * This one tests for a list that is already sorted.
	 * this one failed
	 */
	void test36() {
		sortingComparison test36 = new sortingComparison();
		int arr[] = {0,1,2,3,4,5};
		int arr2[] = {0,1,2,3,4,5};
		test36.quickSort(arr,0,arr.length-1);
		assertArrayEquals(arr,arr2);
		
	}
	
	@Test
	/* This one tests for a list that is in reverse sorted order.
	 * this one failed
	 */
	void test37() {
		sortingComparison test37 = new sortingComparison();
		int arr[] = {5,4,3,2,1,0};
		int arr2[] = {0,1,2,3,4,5};
		test37.quickSort(arr,0,arr.length-1);
		assertArrayEquals(arr,arr2);
	
	}
	
	@Test
	/*
	 * this one tests for one digit being incorrect.
	 */
	void test38() {
		sortingComparison test38 = new sortingComparison();
		int arr[] = {1,2,3,5,4,6};
		int arr2[] = {1,2,3,4,5,6};
		test38.quickSort(arr,0,arr.length-1);
		assertArrayEquals(arr,arr2);
	
	}
	
	@Test
	/*
	 * this one tests for an array that has many multiples of the same value -- especially zero.
	 */
	void test39() {
		sortingComparison test39 = new sortingComparison();
		int arr[] = {0,0,0,1,2,0,0};
		int arr2[] = {0,0,0,0,0,1,2};
		test39.quickSort(arr,0,arr.length-1);
		assertArrayEquals(arr,arr2);
	}
	
	@Test
	
	/*
	 * This tests a large variance in number including negatives.
	 * This one fails.
	 */
	
	void test40() {
		sortingComparison test40 = new sortingComparison();
		int arr[] = {10000,0,-1000000,1000000,10000};
		int arr2[] = {-1000000,-10000,0,10000,1000000};
		test40.quickSort(arr,0,arr.length-1);
		test40.printArray(arr);
		assertArrayEquals(arr,arr2);
	}
	/*
	 * this one tests merge sort with negatives
	 */
	@Test
	void test41() {
		sortingComparison test41 = new sortingComparison();
		int arr[] = {-4,-12,-54,0,24,17};
		int arr2[] = {-54,-12,-4,0,17,24};
		int x = arr.length - 1 ;
		test41.mergesort(arr,0,x);
		assertArrayEquals(arr2, arr);
	}
	
}
