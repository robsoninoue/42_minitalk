/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rotakesh <rotakesh@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/20 17:47:03 by rotakesh          #+#    #+#             */
/*   Updated: 2022/10/25 03:56:13 by rotakesh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <unistd.h>
#include <signal.h>

static void	ft_receive(int sig)
{
	if (sig == SIGUSR2)
		ft_putstr_fd("Message Sent\n", 1);
}

static int	ft_check_nbr(char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		if (!ft_isdigit(str[i++]))
			return (0);
	}
	return (1);
}

static void	ft_send(int pid, char *str)
{
	int					i;
	char				c;

	while (*str)
	{
		c = *str++;
		i = 8;
		while (i)
		{
			signal(SIGUSR1, ft_receive);
			if ((1 << --i) & c)
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			sleep(1);
		}
	}
	i = 8;
	while (i--)
	{
		signal(SIGUSR2, ft_receive);
		signal(SIGUSR1, ft_receive);
		kill(pid, SIGUSR1);
		sleep(1);
	}
}

int	main(int argc, char **argv)
{
	if (argc != 3 || !ft_check_nbr(argv[1]))
		return (-1);
	else
		ft_send(ft_atoi(argv[1]), argv[2]);
	return (0);
}
