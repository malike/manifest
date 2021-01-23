// Package models Data API.
// Terms Of Service:
//
//     Schemes: http
//     Host: localhost:9090
//     Version: 1.0.0
//     Contact: Kendeh Lewis Malike <st.malike@gmail.com>
//
//     Consumes:
//     - application/json
//
//     Produces:
//     - application/json
//
//
// swagger:meta
package models

import "time"

//Data Json request payload,
//  ID (string)
//  Party (string)
//  Section (string)
//  Description (string)
//  Tags ([]string)
// 	DateCreated time
type Data struct {
	ID          string    `json:"id"`
	Party       string    `json:"party"`
	Section     string    `json:"section"`
	Description string    `json:"description"`
	Tags        []string  `json:"tags"`
	DateCreated time.Time `json:"dateCreated"`
}
