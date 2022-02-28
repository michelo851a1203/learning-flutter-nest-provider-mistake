## flutter 錯誤學習

- 因為不能在 Products 使用 removeProduct 去移除子類別項目，所以嘗試用 status 這一項看會不會更新
```
實驗結果是不會，也因為這樣，要用帶入 widget 參數的方式處理比較好，
而非用 nested provider 的方式處理，
```

- 但也因為這樣，如果不考慮刪除資料，用這個方式可以隔艙這樣比較好

note : 
- 我在 Products 有做 showCurrentProductGroup 的方法，可以看到，  
父類別的 Products 的 productGroup 的確有更新資料，但是畫面沒有因此刪除
- 不過子類別的 product status 的變動有讓 icon 變顏色。

- 這裡有另外實驗 consumer 和 Provider.of(context, listen: false)
根據定義， listen  設定為 false 即使資料更新，元件也不會重新渲染
除了 consumer 內指定的物件，這樣可以節省父元件及其他元件額外的渲染
這是好的設計

#### 嘗試: 是否可以參考父元件並帶入 function 執行

