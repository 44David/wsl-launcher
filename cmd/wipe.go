/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>

*/
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// wipeCmd represents the wipe command
var wipeCmd = &cobra.Command{
	Use:   "wipe",
	Short: "Deletes a registered WSL instance",
	Long: `Unregister a WSL instance given the name of a valid and currently installed instance.
		   Usage: wsldwnl wipe Ubuntu-20.04 `,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("wipe called")
	},
}

func init() {
	rootCmd.AddCommand(wipeCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// wipeCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// wipeCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
