/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"log"
	"os/exec"

	"github.com/spf13/cobra"
)

// installCmd represents the install command
var installCmd = &cobra.Command{
	Use:   "install",
	Short: "installs linux distro specified",
	Long: `The install command will download the specified distro.
			Use: wsldwnl install Debian`,

	Run: func(cmd *cobra.Command, args []string) {

		if args[0] == "base" {
			fmt.Println("Installing...")
			execShellScript := `bash scripts/get=base-distro.sh`

			execCommand := exec.Command(execShellScript)

			output, err := execCommand.CombinedOutput()
			if err != nil {
				log.Fatal("Failed to install " + args[1])
			}

			log.Printf("Output: \n %s", string(output))

		}

	},
}

func init() {
	rootCmd.AddCommand(installCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// installCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// installCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
