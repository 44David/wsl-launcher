/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	// "log"
	"os/exec"

	"github.com/manifoldco/promptui"
	"github.com/spf13/cobra"
)

// installCmd represents the install command
var installCmd = &cobra.Command{
	Use:   "install",
	Short: "installs linux distro specified",
	Long: `The install command will download the specified distro.
			Use: wsldwnl install Debian`,

	Run: func(cmd *cobra.Command, args []string) {
		prompt := promptui.Select{
			Label: "Select a distribution",
			Items: []string{"Debian", "CentOS", "Arch Linux (Work in Progress)", "Alpine Linux", "Fedora Linux"},
		}

		_, result, err := prompt.Run()

		if err != nil {
			fmt.Printf("Execution Failed with error %v\n", err)
			return
		}

		switch result {
		case "Debian":
			debian_prompt := promptui.Select{
				Label: "Select a version",
				Items: []string{"Latest", "Bookworm:12", "Bullseye:11", "Buster:10"},
			}

			_, res, err := debian_prompt.Run()

			if err != nil {
				fmt.Printf("Execution Failed %v\n", err)
				return
			}

			fmt.Println("Installing Debian " + res)

			switch res {
				case "Latest":

					execShellScript1 := `wsl`
					execShellScript2 := `sh scripts/base-distro.sh debian latest`

					exec.Command(execShellScript1)
					exec.Command(execShellScript2)

				case "Bookworm:12":
					execShellScript1 := `wsl`
					execShellScript2 := `sh scripts/base-distro.sh debian 12`

					exec.Command(execShellScript1)
					exec.Command(execShellScript2)
				case "Bullseye:11":
					execShellScript1 := `wsl`
					execShellScript2 := `sh scripts/base-distro.sh debian 11`

					exec.Command(execShellScript1)
					exec.Command(execShellScript2)

				case "Buster:10":
					execShellScript1 := `wsl`
					execShellScript2 := `sh scripts/base-distro.sh debian 10`

					exec.Command(execShellScript1)
					exec.Command(execShellScript2)
			}

		case "CentOS":
			execShellScript1 := `wsl`
			execShellScript2 := `sh scripts/get-base-distro.sh centos`

			exec.Command(execShellScript1)
			exec.Command(execShellScript2)

		case "Alpine":
			execShellScript1 := `wsl`
			execShellScript2 := `sh ./get-base-distro.sh alpine`

			exec.Command(execShellScript1)
			exec.Command(execShellScript2)

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
