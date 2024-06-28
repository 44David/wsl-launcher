/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"os/exec"

	"github.com/manifoldco/promptui"
	"github.com/spf13/cobra"
)

// listCmd represents the list command
var listCmd = &cobra.Command{
	Use:   "list",
	Short: "Short message here",
	Long: `Long message here`,
	Run: func(cmd *cobra.Command, args []string) {
		cmd := exec.Command("wsl", "-l")
		
		out, err := cmd.Run()
		if err != nil {
			fmt.Println("Could not execute command. ", err)
		}
		installed_distros := string(out)

		prompt := promptui.Select{
			Label: "Installed WSL Instances:",
			Items: installed_distros,
		}

	},
}

func init() {
	rootCmd.AddCommand(listCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// listCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// listCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
