/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>

*/
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// distrosCmd represents the distros command
var distrosCmd = &cobra.Command{
	Use:   "distros",
	Short: "Display list of all available linux distros",
	Long: `Display list of all available linux distros`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("Debian")
		fmt.Println("Arch Linux")
		fmt.Println("Ubuntu")
		fmt.Println("Fedora")
		fmt.Println("Gentoo")
		fmt.Println("Kali linux")
		fmt.Println("Alpine linux")
	},
}

func init() {
	rootCmd.AddCommand(distrosCmd)

	fmt.Println("Debian")

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// distrosCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// distrosCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
