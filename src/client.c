/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rotakesh <rotakesh@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/20 17:47:03 by rotakesh          #+#    #+#             */
/*   Updated: 2022/09/28 04:44:00 by rotakesh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include <unistd.h>
#include "libft.h"

static void	ft_send(int pid, char *str)
{
	int		i;
	char 	c;

	while(*str)
	{
		c = *str++;
		i = 8;
		while (i)
		{
			if ((1 << --i) & c)
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			usleep(40);
		}
	}
	i = 8;
	while (i--)
	{
		kill(pid, SIGUSR1);
		usleep(40);
	}
}

int	main(int argc, char **argv)
{
	if (argc != 3)
		return (-1);
	else
		ft_send(ft_atoi(argv[1]), argv[2]);
	return (0);
}
