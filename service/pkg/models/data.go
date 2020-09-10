package models

type Data struct {
	Party    string   `json:"party"`
	Section  string   `json:"section"`
	Promises []string `json:"promises"`
	Tags     []string `json:"tags"`
}
