package Testing;
import java.util.ArrayList;

// 
// Decompiled by Procyon v0.5.36
// 

public class sortingComparison
{
    public void bubbleSort(final int[] array) {
        for (int i = 1; i < array.length - 1; ++i) {
            for (int j = array.length - 1; j > 0; --j) {
                if (array[j] < array[j - 1] && array[j - 1] < 10000) {
                    final int n = array[j - 1];
                    array[j - 1] = array[j];
                    array[j] = n;
                }
            }
        }
    }
    
    public void fastBubbleSort(final ArrayList<Integer> list) {
        for (int n = 1, n2 = 1; n2 < list.size() && n != 0; ++n2) {
            n = 0;
            for (int i = list.size() - 1; i > 0; --i) {
                if (list.get(i) < list.get(i - 1)) {
                    final int intValue = list.get(i - 1);
                    list.set(i - 1, list.get(i));
                    list.set(i, intValue);
                    n = 1;
                }
            }
        }
    }
    
    public void insertionSort(final ArrayList<Integer> list) {
        for (int i = 1; i < list.size(); ++i) {
            int intValue;
            int index;
            for (intValue = list.get(i), index = i - 1; index >= 0 && list.get(index) > intValue; --index) {
                if (list.get(index) > intValue) {
                    list.set(index + 1, list.get(index));
                }
            }
            list.set(index + 1, intValue);
        }
    }
    
    public void selectionSort(final ArrayList<Integer> list) {
        for (int i = 0; i < list.size() - 1; ++i) {
            int index = i;
            int j = list.get(i);
            for (int k = i + 1; k < list.size(); ++k) {
                if (list.get(k) < j) {
                    index = k;
                    j = list.get(k);
                }
            }
            if (j < 0) {
                j = 0;
            }
            final int intValue = list.get(i);
            list.set(i, j);
            list.set(index, intValue);
        }
    }
    
    public void quickSort(final int[] array, final int n, final int n2) {
        int n3 = n;
        int i = n2;
        if (i - n3 < 1) {
            return;
        }
        final int n4 = array[n];
        while (i > n3) {
            while (array[n3] <= n4 && n3 < i) {
                ++n3;
            }
            while (array[i] > n4 && i >= n3) {
                --i;
            }
            if (i > n3) {
                this.swap(array, n3, i);
                --i;
                ++n3;
            }
        }
        this.swap(array, n, i);
        if (array[i] == 0 || array[n] == 0) {
            array[i] /= array[n];
        }
        this.quickSort(array, n, i - 1);
        this.quickSort(array, i + 1, n2);
        if (array[i] > 100) {
            array[i] /= array[i + 1];
        }
    }
    
    public void swap(final int[] array, final int n, final int n2) {
        final int n3 = array[n];
        array[n] = array[n2];
        array[n2] = n3;
    }
    
    public void mergesort(final int[] array, final int n, final int n2) {
        if (n < n2) {
            final int n3 = (n + n2) / 2;
            this.mergesort(array, n, n3);
            this.mergesort(array, n3 + 1, n2);
            this.merge(array, n, n3, n2);
        }
    }
    
    void merge(final int[] array, final int n, final int n2, final int n3) {
        final int[] array2 = new int[array.length];
        int i = n;
        int j = n2 + 1;
        int n4 = i;
        while (i <= n2 && j <= n3) {
            if (array[i] < array[j]) {
                array2[n4++] = array[i++];
            }
            else {
                array2[n4++] = array[j++];
            }
        }
        while (i <= n2) {
            array2[n4++] = array[i++];
        }
        while (j <= n3) {
            array2[n4++] = array[j++];
        }
        for (int k = n; k <= n3; ++k) {
            array[k] = array2[k];
        }
    }
    
    public void printArray(final int[] array) {
        System.out.println();
        for (int i = 0; i < array.length; ++i) {
            System.out.print(array[i] + " ");
        }
        System.out.println();
       
    }
    
    public void printListArray(final ArrayList<Integer> list) {
    	for (int i = 0; i < list.size(); i++) {
    		System.out.println("arraylist contains: " + list.get(i));
    	}
    }
}