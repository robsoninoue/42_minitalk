/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rotakesh <rotakesh@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/20 17:51:42 by rotakesh          #+#    #+#             */
/*   Updated: 2022/09/28 04:24:43 by rotakesh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <unistd.h>
#include <signal.h>
# include <stdlib.h>
# include <stdio.h>
# include <bits/signum.h>

void	ft_signalhandler(int sig)
{
	static int				i = 0;
	static unsigned char	c = 0;

	if (i == 8)
	{
		ft_putchar_fd(c, 1);
		i = 0;
		c = 0;
	}
	if (sig == SIGUSR2)
		c = c | 1;
	if (i < 7)
		c = c << 1;
	i++;
}

int	main(void)
{ 
	int					pid;
	// struct sigaction 	sig;
	
	// sig.sa_handler = ft_signalhandler;
	pid = getpid();
	ft_putnbr_fd(pid, 1);
	ft_putchar_fd('\n', 1);
	signal(SIGUSR1, ft_signalhandler);
	signal(SIGUSR2, ft_signalhandler);
	// sigaction(SIGUSR1, &sig, 0);
	// sigaction(SIGUSR2, &sig, 0);
	while (1)
		pause();
	return (0);
}


/*
// void sighandler(int sign, siginfo_t *info, void *context)
void sighandler(int sign)
{
	printf("signal USR1: %d\n", sign);
	// exit(1);
}
void sighandlertxt(int sign)
{
	printf("signal USR2: %d\n", sign);
	// exit(1);
}

int main(void)
{
	int pid;
	
	pid = getpid();
	printf("%d\n", pid);
	signal(SIGUSR1, sighandler);
	signal(SIGUSR2, sighandlertxt);
	while (1)
		pause();
	return (0);
}
*/