# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rotakesh <rotakesh@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/20 15:46:14 by rotakesh          #+#    #+#              #
#    Updated: 2022/10/14 23:10:38 by rotakesh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables

SRCS =			client.c server.c
#NAME =			minitalk
CLIENT_NAME =	client
SERVER_NAME = 	server
OBJ_DIR =		obj
SRC_DIR =		src
#CLIENT_SRCS =	client.c \
#				main.c
#SERVER_SRCS =	server.c \
#				main.c
#INC =			-Iinc -Ilibft
#CLIENT_OBJS =	${CLIENT_SRCS:%.c=${OBJ_DIR}/%.o}
#SERVER_OBJS =	${SERVER_SRCS:%.c=${OBJ_DIR}/%.o}
CC =			gcc
RM =			rm -rf
CFLAGS =		-Wall -Werror -Wextra
#LIBFT = 		make -C libft

# Rules

#${SERVER_NAME}:	${OBJ_DIR} ${SERVER_OBJS} ${CLIENT_NAME}
#				${CC} ${SERVER_OBJS} -o ${SERVER_NAME} ${CFLAGS} ${INC} -Llibft -lft
#				@echo "Server created"

#${CLIENT_NAME}:	${OBJ_DIR} ${CLIENT_OBJS}
#				${CC} ${CLIENT_OBJS} -o ${CLIENT_NAME} ${CFLAGS} ${INC} -Llibft -lft
#				@echo "Client created"

# ${OBJ_DIR}:
#				mkdir -p ${OBJ_DIR}

#${OBJ_DIR}/%.o:	${SRC_DIR}/%.c
#				${CC} ${CFLAGS} ${INC} -c $< -o $@

all:			libft server client

server:
				${CC} -o ${SERVER_NAME} ${SRC_DIR}/server.c -Ilibft -Llibft -lft

client:
				${CC} -o ${CLIENT_NAME} ${SRC_DIR}/client.c -Ilibft -Llibft -lft

#server:			
#				${CC} -o $@ $< -Llibft -lft

#client:			
#				${CC} -o $@ $< -Llibft -lft

#%.o:			%c
#				${CC} ${CFLAGS} $< -c ${INC} $?

libft:
				make -C libft

clean:
				@${RM} ${OBJ_DIR}
				@echo "Objects removed"

fclean:			clean
				@${RM} ${CLIENT_NAME}
				@${RM} ${SERVER_NAME}
				make -C libft fclean
				@echo "Client and Server removed"

re:				fclean all

.PHONY:			all clean fclean re libft