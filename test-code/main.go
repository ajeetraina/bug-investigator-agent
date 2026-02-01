// main.go - Sample buggy Go code for testing Bug Investigator
package main

import "fmt"

// Config - HAS A BUG: nil pointer dereference
type Config struct {
    Database *DatabaseConfig
}

type DatabaseConfig struct {
    Host string
    Port int
}

func processConfig(cfg *Config) {
    // BUG: No nil check - will panic if cfg or cfg.Database is nil
    fmt.Println(cfg.Database.Host)
}

// BUG: Slice bounds out of range
func getFirstElement(slice []string) string {
    return slice[0] // Panics if slice is empty
}

// BUG: Map not initialized
func addToMap(m map[string]int, key string, value int) {
    m[key] = value // Panics if map is nil
}

func main() {
    var cfg *Config
    processConfig(cfg) // Will panic!
}
