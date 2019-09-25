package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {

	url := "https://jsonplaceholder.typicode.com/comments"

	req, _ := http.NewRequest("GET", url, nil)

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}
